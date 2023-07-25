//
//  URLSessionDelegateMiddleware+URLSessionStreamDelegate.swift
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

// MARK: URLSessionStreamDelegate

extension URLSessionDelegateMiddleware: URLSessionStreamDelegate {
    public func urlSession(_ session: URLSession, readClosedFor streamTask: URLSessionStreamTask) {
        let selector = #selector(URLSessionStreamDelegate.urlSession(_:readClosedFor:)
            as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?)

        defer { networkLogger.log(readClosedFor: streamTask) }

        guard let urlSessionStreamDelegate = urlSessionDelegate as? URLSessionStreamDelegate,
              urlSessionStreamDelegate.responds(to: selector)
        else { return }

        urlSessionStreamDelegate.urlSession!(session, readClosedFor: streamTask)
    }

    public func urlSession(_ session: URLSession, writeClosedFor streamTask: URLSessionStreamTask) {
        let selector = #selector(URLSessionStreamDelegate.urlSession(_:writeClosedFor:)
            as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?)

        defer { networkLogger.log(writeClosedFor: streamTask) }

        guard let urlSessionStreamDelegate = urlSessionDelegate as? URLSessionStreamDelegate,
              urlSessionStreamDelegate.responds(to: selector)
        else { return }

        urlSessionStreamDelegate.urlSession!(session, writeClosedFor: streamTask)
    }

    public func urlSession(_ session: URLSession, betterRouteDiscoveredFor streamTask: URLSessionStreamTask) {
        let selector = #selector(URLSessionStreamDelegate.urlSession(_:betterRouteDiscoveredFor:)
            as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask) -> Void)?)

        defer { networkLogger.log(betterRouteDiscoveredFor: streamTask) }

        guard let urlSessionStreamDelegate = urlSessionDelegate as? URLSessionStreamDelegate,
              urlSessionStreamDelegate.responds(to: selector)
        else { return }

        urlSessionStreamDelegate.urlSession!(session, betterRouteDiscoveredFor: streamTask)
    }

    public func urlSession(_ session: URLSession, streamTask: URLSessionStreamTask, didBecome inputStream: InputStream, outputStream: OutputStream) {
        let selector = #selector(URLSessionStreamDelegate.urlSession(_:streamTask:didBecome:outputStream:)
            as (URLSessionStreamDelegate) -> ((URLSession, URLSessionStreamTask, InputStream, OutputStream) -> Void)?)

        defer { networkLogger.log(streamTask, didBecome: inputStream, outputStream: outputStream) }

        guard let urlSessionStreamDelegate = urlSessionDelegate as? URLSessionStreamDelegate,
              urlSessionStreamDelegate.responds(to: selector)
        else { return }

        urlSessionStreamDelegate.urlSession!(session, streamTask: streamTask, didBecome: inputStream, outputStream: outputStream)
    }
}
