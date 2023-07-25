//
//  URLSessionDelegateMiddleware+URLSessionWebSocketDelegate.swift
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

// MARK: URLSessionWebSocketDelegate

extension URLSessionDelegateMiddleware: URLSessionWebSocketDelegate {
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        let selector = #selector(URLSessionWebSocketDelegate.urlSession(_:webSocketTask:didOpenWithProtocol:)
            as (URLSessionWebSocketDelegate) -> ((URLSession, URLSessionWebSocketTask, String?) -> Void)?)

        defer { networkLogger.log(webSocketTask, didOpenWithProtocol: `protocol`) }

        guard let urlSessionWebSocketDelegate = urlSessionDelegate as? URLSessionWebSocketDelegate,
              urlSessionWebSocketDelegate.responds(to: selector)
        else { return }

        urlSessionWebSocketDelegate.urlSession!(session, webSocketTask: webSocketTask, didOpenWithProtocol: `protocol`)
    }

    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        let selector = #selector(URLSessionWebSocketDelegate.urlSession(_:webSocketTask:didCloseWith:reason:)
            as (URLSessionWebSocketDelegate) -> ((URLSession, URLSessionWebSocketTask, URLSessionWebSocketTask.CloseCode, Data?) -> Void)?)

        defer { networkLogger.log(webSocketTask, didCloseWith: closeCode, reason: reason) }

        guard let urlSessionWebSocketDelegate = urlSessionDelegate as? URLSessionWebSocketDelegate,
              urlSessionWebSocketDelegate.responds(to: selector)
        else { return }

        urlSessionWebSocketDelegate.urlSession!(session, webSocketTask: webSocketTask, didCloseWith: closeCode, reason: reason)
    }
}
