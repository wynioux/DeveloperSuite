//
//  URLSessionDelegateMiddleware+URLSessionDownloadDelegate.swift
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

// MARK: URLSessionDownloadDelegate

extension URLSessionDelegateMiddleware: URLSessionDownloadDelegate {
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let selector = #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didFinishDownloadingTo:)
            as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, URL) -> Void)?)

        defer { NetworkLogger.log(downloadTask, didFinishDownloadingTo: location) }

        guard let urlSessionDownloadDelegate = urlSessionDelegate as? URLSessionDownloadDelegate,
              urlSessionDownloadDelegate.responds(to: selector)
        else { return }

        urlSessionDownloadDelegate.urlSession(session, downloadTask: downloadTask, didFinishDownloadingTo: location)
    }

    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let selector = #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:)
            as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, Int64, Int64, Int64) -> Void)?)

        defer { NetworkLogger.log(downloadTask, didWriteData: bytesWritten, totalBytesWritten: totalBytesWritten, totalBytesExpectedToWrite: totalBytesExpectedToWrite) }

        guard let urlSessionDownloadDelegate = urlSessionDelegate as? URLSessionDownloadDelegate,
              urlSessionDownloadDelegate.responds(to: selector)
        else { return }

        urlSessionDownloadDelegate.urlSession!(session, downloadTask: downloadTask, didWriteData: bytesWritten, totalBytesWritten: totalBytesWritten, totalBytesExpectedToWrite: totalBytesExpectedToWrite)
    }

    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        let selector = #selector(URLSessionDownloadDelegate.urlSession(_:downloadTask:didResumeAtOffset:expectedTotalBytes:)
            as (URLSessionDownloadDelegate) -> ((URLSession, URLSessionDownloadTask, Int64, Int64) -> Void)?)

        defer { NetworkLogger.log(downloadTask, didResumeAtOffset: fileOffset, expectedTotalBytes: expectedTotalBytes) }

        guard let urlSessionDownloadDelegate = urlSessionDelegate as? URLSessionDownloadDelegate,
              urlSessionDownloadDelegate.responds(to: selector)
        else { return }

        urlSessionDownloadDelegate.urlSession!(session, downloadTask: downloadTask, didResumeAtOffset: fileOffset, expectedTotalBytes: expectedTotalBytes)
    }
}
