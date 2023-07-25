//
//  URLSessionDelegateMiddleware+URLSessionDataDelegate.swift
//  DSNetwork
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

// MARK: URLSessionDataDelegate

extension URLSessionDelegateMiddleware: URLSessionDataDelegate {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        let selector: Selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:completionHandler:) as
            (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLResponse, @escaping (URLSession.ResponseDisposition) -> Void) -> Void)?)

        var responseDisposition: URLSession.ResponseDisposition = .allow

        defer { networkLogger.log(dataTask, didReceive: response, responseDisposition: responseDisposition) }

        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
              urlSessionDataDelegate.responds(to: selector)
        else { return completionHandler(responseDisposition) }

        urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, didReceive: response) {
            responseDisposition = $0

            completionHandler(responseDisposition)
        }
    }

//    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
//        let selector: Selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:)
//            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLResponse) async -> URLSession.ResponseDisposition)?)
//
//        var responseDisposition: URLSession.ResponseDisposition = .allow
//
//        defer { networkLogger.log(dataTask, didReceive: response, responseDisposition: responseDisposition) }
//
//        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
//              urlSessionDataDelegate.responds(to: selector)
//        else { return responseDisposition }
//
//        responseDisposition = await urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, didReceive: response)
//
//        return responseDisposition
//    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {
        let selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:didBecome:)
            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLSessionDownloadTask) -> Void)?)

        defer { networkLogger.log(dataTask, didBecome: downloadTask) }

        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
              urlSessionDataDelegate.responds(to: selector)
        else { return }

        urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, didBecome: downloadTask)
    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask) {
        let selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:didBecome:)
            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, URLSessionStreamTask) -> Void)?)

        defer { networkLogger.log(dataTask, didBecome: streamTask) }

        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
              urlSessionDataDelegate.responds(to: selector)
        else { return }

        urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, didBecome: streamTask)
    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:)
            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, Data) -> Void)?)

        defer { networkLogger.log(dataTask, didReceive: data) }

        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
              urlSessionDataDelegate.responds(to: selector)
        else { return }

        urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, didReceive: data)
    }

    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: @escaping (CachedURLResponse?) -> Void) {
        let selector: Selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:willCacheResponse:completionHandler:)
            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, CachedURLResponse, @escaping (CachedURLResponse?) -> Void) -> Void)?)

        var cachedURLResponse: CachedURLResponse? = proposedResponse

        defer { networkLogger.log(dataTask, willCacheResponse: proposedResponse, cachedURLResponse: cachedURLResponse) }

        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
              urlSessionDataDelegate.responds(to: selector)
        else { return completionHandler(cachedURLResponse) }

        urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, willCacheResponse: proposedResponse) {
            cachedURLResponse = $0

            completionHandler(cachedURLResponse)
        }
    }

//    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse) async -> CachedURLResponse? {
//        let selector: Selector = #selector(URLSessionDataDelegate.urlSession(_:dataTask:willCacheResponse:)
//            as (URLSessionDataDelegate) -> ((URLSession, URLSessionDataTask, CachedURLResponse) async -> CachedURLResponse?)?)
//
//        var cachedURLResponse: CachedURLResponse? = proposedResponse
//
//        defer { networkLogger.log(dataTask, willCacheResponse: proposedResponse, cachedURLResponse: cachedURLResponse) }
//
//        guard let urlSessionDataDelegate = urlSessionDelegate as? URLSessionDataDelegate,
//              urlSessionDataDelegate.responds(to: selector)
//        else { return cachedURLResponse }
//
//        cachedURLResponse = await urlSessionDataDelegate.urlSession!(session, dataTask: dataTask, willCacheResponse: proposedResponse)
//
//        return cachedURLResponse
//    }
}
