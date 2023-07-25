//
//  URLProtocolMiddleware.swift
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

// MARK: URLProtocolMiddleware

public final class URLProtocolMiddleware: URLProtocol {
    public static let shared = URLProtocolMiddleware()

    private let session: URLSession
    private weak var sessionTask: URLSessionTask?

    override public init(request: URLRequest, cachedResponse: CachedURLResponse?, client: URLProtocolClient?) {
        let configuration: URLSessionConfiguration = .default
        let delegate: URLSessionDelegate? = URLProtocolMiddlewareDelegate.shared // URLSessionDelegateMiddleware(urlSessionDelegate: URLProtocolMiddlewareDelegate.shared)
        let delegateQueue: OperationQueue? = URLProtocolMiddlewareDelegate.shared.queue

        self.session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: delegateQueue)

        super.init(request: request, cachedResponse: cachedResponse, client: client)
    }

    deinit {
        session.finishTasksAndInvalidate()
    }

    override public class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override public class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override public func startLoading() {
        sessionTask = session.dataTask(with: request)
        URLProtocolMiddlewareDelegate.shared.register(for: sessionTask, middleware: self)
        sessionTask?.resume()
    }

    override public func stopLoading() {
        URLProtocolMiddlewareDelegate.shared.remove(for: sessionTask)
        sessionTask?.cancel()
    }
}
