//
//  URLSessionDelegateMiddleware+URLSessionTaskDelegate.swift
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

// MARK: URLSessionTaskDelegate

extension URLSessionDelegateMiddleware: URLSessionTaskDelegate {
    @available(iOS 16.0, *)
    public func urlSession(_ session: URLSession, didCreateTask task: URLSessionTask) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:didCreateTask:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) -> Void)?)

        defer { NetworkLogger.log(didCreateTask: task) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return }

        urlSessionTaskDelegate.urlSession!(session, didCreateTask: task)
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, willBeginDelayedRequest request: URLRequest, completionHandler: @escaping (URLSession.DelayedRequestDisposition, URLRequest?) -> Void) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:willBeginDelayedRequest:completionHandler:) as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLRequest, @escaping (URLSession.DelayedRequestDisposition, URLRequest?) -> Void) -> Void)?)

        var delayedRequestDisposition: URLSession.DelayedRequestDisposition = .continueLoading
        var urlRequest: URLRequest? = request

        defer { NetworkLogger.log(task, willBeginDelayedRequest: request, delayedRequestDisposition: delayedRequestDisposition, urlRequest: urlRequest) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return completionHandler(delayedRequestDisposition, urlRequest) }

        urlSessionTaskDelegate.urlSession!(session, task: task, willBeginDelayedRequest: request) {
            delayedRequestDisposition = $0
            urlRequest = $1

            completionHandler(delayedRequestDisposition, urlRequest)
        }
    }

//    public func urlSession(_ session: URLSession, task: URLSessionTask, willBeginDelayedRequest request: URLRequest) async -> (URLSession.DelayedRequestDisposition, URLRequest?) {
//        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:willBeginDelayedRequest:)
//            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLRequest) async -> (URLSession.DelayedRequestDisposition, URLRequest?))?)
//
//        var delayedRequestDisposition: URLSession.DelayedRequestDisposition = .continueLoading
//        var urlRequest: URLRequest? = request
//
//        defer { NetworkLogger.log(task, willBeginDelayedRequest: request, delayedRequestDisposition: delayedRequestDisposition, urlRequest: urlRequest) }
//
//        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
//              urlSessionTaskDelegate.responds(to: selector)
//        else { return (delayedRequestDisposition, urlRequest) }
//
//        (delayedRequestDisposition, urlRequest) = await urlSessionTaskDelegate.urlSession!(session, task: task, willBeginDelayedRequest: request)
//
//        return (delayedRequestDisposition, urlRequest)
//    }

    public func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:taskIsWaitingForConnectivity:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) -> Void)?)

        defer { NetworkLogger.log(taskIsWaitingForConnectivity: task) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return }

        urlSessionTaskDelegate.urlSession!(session, taskIsWaitingForConnectivity: task)
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:willPerformHTTPRedirection:newRequest:completionHandler:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, HTTPURLResponse, URLRequest, @escaping (URLRequest?) -> Void) -> Void)?)

        var urlRequest: URLRequest? = request

        defer { NetworkLogger.log(task, willPerformHTTPRedirection: response, newRequest: request, urlRequest: urlRequest) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return completionHandler(urlRequest) }

        urlSessionTaskDelegate.urlSession!(session, task: task, willPerformHTTPRedirection: response, newRequest: request) {
            urlRequest = $0

            completionHandler(urlRequest)
        }
    }

//    public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest) async -> URLRequest? {
//        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:willPerformHTTPRedirection:newRequest:)
//            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, HTTPURLResponse, URLRequest) async -> URLRequest?)?)
//
//        var urlRequest: URLRequest? = request
//
//        defer { NetworkLogger.log(task, willPerformHTTPRedirection: response, newRequest: request, urlRequest: urlRequest) }
//
//        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
//              urlSessionTaskDelegate.responds(to: selector)
//        else { return urlRequest }
//
//        urlRequest = await urlSessionTaskDelegate.urlSession!(session, task: task, willPerformHTTPRedirection: response, newRequest: request)
//
//        return urlRequest
//    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:didReceive:completionHandler:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?)

        var authChallengeDisposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
        var urlCredential: URLCredential? = nil

        defer { NetworkLogger.log(task, didReceive: challenge, authChallengeDisposition: authChallengeDisposition, urlCredential: urlCredential) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return completionHandler(authChallengeDisposition, urlCredential) }

        urlSessionTaskDelegate.urlSession!(session, task: task, didReceive: challenge) {
            authChallengeDisposition = $0
            urlCredential = $1

            completionHandler(authChallengeDisposition, urlCredential)
        }
    }

//    public func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
//        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:didReceive:)
//            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?))?)
//
//        var authChallengeDisposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
//        var urlCredential: URLCredential? = nil
//
//        defer { NetworkLogger.log(task, didReceive: challenge, authChallengeDisposition: authChallengeDisposition, urlCredential: urlCredential) }
//
//        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
//              urlSessionTaskDelegate.responds(to: selector)
//        else { return (authChallengeDisposition, urlCredential) }
//
//        (authChallengeDisposition, urlCredential) = await urlSessionTaskDelegate.urlSession!(session, task: task, didReceive: challenge)
//
//        return (authChallengeDisposition, urlCredential)
//    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Void) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:needNewBodyStream:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, @escaping (InputStream?) -> Void) -> Void)?)

        var inputStream: InputStream? = nil

        defer { NetworkLogger.log(task, needNewBodyStream: inputStream) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return completionHandler(inputStream) }

        urlSessionTaskDelegate.urlSession!(session, task: task) {
            inputStream = $0

            completionHandler(inputStream)
        }
    }

//    public func urlSession(_ session: URLSession, needNewBodyStreamForTask task: URLSessionTask) async -> InputStream? {
//        let selector = #selector(URLSessionTaskDelegate.urlSession(_:needNewBodyStreamForTask:)
//            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask) async -> InputStream?)?)
//
//        var inputStream: InputStream? = nil
//
//        defer { NetworkLogger.log(task, needNewBodyStream: inputStream) }
//
//        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
//              urlSessionTaskDelegate.responds(to: selector)
//        else { return inputStream }
//
//        inputStream = await urlSessionTaskDelegate.urlSession!(session, needNewBodyStreamForTask: task)
//
//        return inputStream
//    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, Int64, Int64, Int64) -> Void)?)

        defer { NetworkLogger.log(task, didSendBodyData: bytesSent, totalBytesSent: totalBytesSent, totalBytesExpectedToSend: totalBytesExpectedToSend) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return }

        urlSessionTaskDelegate.urlSession!(session, task: task, didSendBodyData: bytesSent, totalBytesSent: totalBytesSent, totalBytesExpectedToSend: totalBytesExpectedToSend)
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:didFinishCollecting:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, URLSessionTaskMetrics) -> Void)?)

        defer { NetworkLogger.log(task, didFinishCollecting: metrics) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return }

        urlSessionTaskDelegate.urlSession!(session, task: task, didFinishCollecting: metrics)
    }

    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        let selector = #selector(URLSessionTaskDelegate.urlSession(_:task:didCompleteWithError:)
            as (URLSessionTaskDelegate) -> ((URLSession, URLSessionTask, Error?) -> Void)?)

        defer { NetworkLogger.log(task, didCompleteWithError: error) }

        guard let urlSessionTaskDelegate = urlSessionDelegate as? URLSessionTaskDelegate,
              urlSessionTaskDelegate.responds(to: selector)
        else { return }

        urlSessionTaskDelegate.urlSession!(session, task: task, didCompleteWithError: error)
    }
}
