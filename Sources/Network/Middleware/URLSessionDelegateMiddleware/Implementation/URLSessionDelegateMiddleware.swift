//
//  URLSessionDelegateMiddleware.swift
//  Network
//
//  Copyright (c) 2023 Bahadır A. Güder
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

// MARK: URLSessionDelegateMiddleware

/// A middleware object that serves as a delegate for `URLSession` objects.
///
/// This class allows a single object to act as a delegate for multiple `URLSession` instances, by implementing
/// all of the delegate protocols and forwarding the delegate method calls to an optional delegate object.
public final class URLSessionDelegateMiddleware: NSObject {
    // MARK: Properties
    
    let urlSessionDelegate: URLSessionDelegate?
    let priority: TaskPriority = .utility
    
    // MARK: Initializer
    
    init(urlSessionDelegate: URLSessionDelegate?) {
        self.urlSessionDelegate = urlSessionDelegate
    }
    
    private let interceptedSelectors: Set<Selector> = {
        var interceptedSelectors = Set<Selector>()
        
        let urlSessionDelegateSelectors: Set<Selector> = [
            #selector(URLSessionDelegate.urlSession(_:didBecomeInvalidWithError:) as (URLSessionDelegate) -> ((URLSession, Error?) -> Void)?),
            #selector(URLSessionDelegate.urlSession(_:didReceive:completionHandler:) as (URLSessionDelegate) -> ((URLSession, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?),
            // #selector(URLSessionDelegate.urlSession(_:didReceive:) as (URLSessionDelegate) -> ((URLSession, URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?))?),
            #selector(URLSessionDelegate.urlSessionDidFinishEvents(forBackgroundURLSession:) as (URLSessionDelegate) -> ((URLSession) -> Void?)?)
        ]
        
        interceptedSelectors.formUnion(urlSessionDelegateSelectors)
        
        var urlSessionTaskDelegateSelectors: Set<Selector> = [
            #selector(URLSessionTaskDelegate.urlSession(_:task:willBeginDelayedRequest:completionHandler:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLRequest, @escaping (URLSession.DelayedRequestDisposition, URLRequest?) -> Void) -> Void)?),
            // #selector(URLSessionTaskDelegate.urlSession(_:task:willBeginDelayedRequest:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLRequest) async -> (URLSession.DelayedRequestDisposition, URLRequest?))?),
            #selector(URLSessionTaskDelegate.urlSession(_:taskIsWaitingForConnectivity:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) -> Void)?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:willPerformHTTPRedirection:newRequest:completionHandler:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, HTTPURLResponse, URLRequest, @escaping (URLRequest?) -> Void) -> Void)?),
            // #selector(URLSessionTaskDelegate.urlSession(_:task:willPerformHTTPRedirection:newRequest:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, HTTPURLResponse, URLRequest) async -> URLRequest?)?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:didReceive:completionHandler:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?),
            // #selector(URLSessionTaskDelegate.urlSession(_:task:didReceive:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?))?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:needNewBodyStream:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, @escaping (InputStream?) -> Void) -> Void)?),
            // #selector(URLSessionTaskDelegate.urlSession(_:needNewBodyStreamForTask:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) async -> InputStream?)?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, Int64, Int64, Int64) -> Void)?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:didFinishCollecting:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLSessionTaskMetrics) -> Void)?),
            #selector(URLSessionTaskDelegate.urlSession(_:task:didCompleteWithError:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, Error?) -> Void)?)
        ]
        
        if #available(iOS 16, *) {
            urlSessionTaskDelegateSelectors.insert(#selector(URLSessionTaskDelegate.urlSession(_:didCreateTask:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) -> Void)?))
        }
        
        interceptedSelectors.formUnion(urlSessionTaskDelegateSelectors)
        
        let urlSessionDataDelegateSelectors: Set<Selector> = [
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:completionHandler:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLResponse, @escaping (URLSession.ResponseDisposition) -> Void) -> Void)?),
            // #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLResponse) async -> URLSession.ResponseDisposition)?),
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:didBecome:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLSessionDownloadTask) -> Void)?),
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:didBecome:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLSessionStreamTask) -> Void)?),
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, Data) -> Void)?),
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:willCacheResponse:completionHandler:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, CachedURLResponse, @escaping (CachedURLResponse?) -> Void) -> Void)?)
            // #selector(URLSessionDataDelegate.urlSession(_:dataTask:willCacheResponse:) as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, CachedURLResponse) async -> CachedURLResponse?)?)
        ]
        
        interceptedSelectors.formUnion(urlSessionDataDelegateSelectors)
        
        let urlSessionDownloadDelegateSelectors: Set<Selector> = [
            #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didFinishDownloadingTo:) as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, URL) -> Void)?),
            #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:) as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, Int64, Int64, Int64) -> Void)?),
            #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didResumeAtOffset:expectedTotalBytes:) as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, Int64, Int64) -> Void)?)
        ]
        
        interceptedSelectors.formUnion(urlSessionDownloadDelegateSelectors)
        
        let urlSessionStreamDelegateSelectors: Set<Selector> = [
            #selector(URLSessionStreamDelegate.urlSession(_:readClosedFor:) as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?),
            #selector(URLSessionStreamDelegate.urlSession(_:writeClosedFor:) as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?),
            #selector(URLSessionStreamDelegate.urlSession(_:betterRouteDiscoveredFor:) as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?),
            #selector(URLSessionStreamDelegate.urlSession(_:streamTask:didBecome:outputStream:) as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask, InputStream, OutputStream) -> Void)?)
        ]
        
        interceptedSelectors.formUnion(urlSessionStreamDelegateSelectors)
        
        let urlSessionWebSocketDelegateSelectors: Set<Selector> = [
            #selector(URLSessionWebSocketDelegate.urlSession(_:webSocketTask:didOpenWithProtocol:) as (URLSessionWebSocketDelegate) -> ((URLSession, URLSessionWebSocketTask, String?) -> Void)?),
            #selector(URLSessionWebSocketDelegate.urlSession(_:webSocketTask:didCloseWith:reason:) as (URLSessionWebSocketDelegate) -> ((URLSession, URLSessionWebSocketTask, URLSessionWebSocketTask.CloseCode, Data?) -> Void)?)
        ]
        
        interceptedSelectors.formUnion(urlSessionWebSocketDelegateSelectors)
        
        return interceptedSelectors
    }()
    
    // MARK: Forwarding Target
    
    override public func forwardingTarget(for aSelector: Selector!) -> Any? {
        if didImplementAuthChallengeForTask(urlSessionDelegate, selector: aSelector) {
            return urlSessionDelegate
        }
        
        guard !interceptedSelectors.contains(aSelector) else {
            return nil
        }
       
        return urlSessionDelegate
    }

    // MARK: Responds

    override public func responds(to aSelector: Selector!) -> Bool {
        if didImplementAuthChallengeForTask(urlSessionDelegate, selector: aSelector) {
            return false
        }
        
        guard !interceptedSelectors.contains(aSelector) else {
            return true
        }
        
        let delegateResponds = urlSessionDelegate?.responds(to: aSelector) ?? false
        let superResponds = super.responds(to: aSelector)
        
        return delegateResponds || superResponds
    }
    
    private func didImplementAuthChallengeForTask(_ delegate: URLSessionDelegate?, selector: Selector) -> Bool {
        let sessionAuthenticationSelector = #selector(URLSessionDelegate.urlSession(_:didReceive:completionHandler:)
            as (URLSessionDelegate) -> ((URLSession, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?)
        
        let taskAuthenticationSelector = #selector(URLSessionTaskDelegate.urlSession(_:task:didReceive:completionHandler:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?)
        
        guard selector == sessionAuthenticationSelector,
              let delegate,
              delegate.responds(to: taskAuthenticationSelector),
              !delegate.responds(to: sessionAuthenticationSelector)
        else { return false }
        
        return true
    }
}
