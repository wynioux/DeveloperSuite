//
//  NetworkLogger+URLSessionTaskDelegate.swift
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

import DSPersistence
import Foundation

// MARK: URLSessionTaskDelegate

extension NetworkLogger {
    func log(didCreateTask task: URLSessionTask) {
        createEntityIfNecessary(from: task)
    }

    func log(_ task: URLSessionTask, willBeginDelayedRequest request: URLRequest, delayedRequestDisposition: URLSession.DelayedRequestDisposition, urlRequest: URLRequest?) {}

    func log(taskIsWaitingForConnectivity task: URLSessionTask) {}

    func log(_ task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, urlRequest: URLRequest?) {
        // If `request` and `urlRequest` are not equal, it means redirecting to another
        // URL and not to the URL requested by the server, which means there is custom
        // logic in the delegate.

        // If `urlRequest` is nil, it means no redirection.

        guard let request = urlRequest else { return }

        createEntityIfNecessary(from: task)

        store.perform { [weak self] context in
            guard let self,
                  let entity = getEntity(from: task)
            else { return }

            entity.currentRequest = .init(context: context, request: request)
        }
    }

    func log(_ task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, authChallengeDisposition: URLSession.AuthChallengeDisposition, urlCredential: URLCredential?) {
        createEntityIfNecessary(from: task)
    }

    func log(_ task: URLSessionTask, needNewBodyStream: InputStream?) {}

    func log(_ task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {}

    func log(_ task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        store.perform { [weak self] context in
            guard let self,
                  let entity = getEntity(from: task)
            else { return }

            entity.metrics = .init(context: context, metrics: metrics)
        }
    }

    func log(_ task: URLSessionTask, didCompleteWithError error: Error?) {
        store.perform { [weak self] context in
            guard let self,
                  let entity = getEntity(from: task)
            else { return }

            entity.rawState = error == nil ? 1 : 2

            guard let error else { return }

            entity.error = .init(context: context, error: error)
        }
    }
}
