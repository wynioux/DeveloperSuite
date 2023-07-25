//
//  NetworkLogger+URLSessionDataDelegate.swift
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

import DSModel
import Foundation

// MARK: URLSessionDataDelegate

extension NetworkLogger {
    func log(_ dataTask: URLSessionDataTask, didReceive response: URLResponse, responseDisposition: URLSession.ResponseDisposition) {
        createEntityIfNecessary(from: dataTask)

        store.perform { [weak self] context in
            guard let self,
                  let entity = getEntity(from: dataTask)
            else { return }

            entity.response = .init(context: context, response: response)
        }
    }

    func log(_ dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {}

    func log(_ dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask) {}

    func log(_ dataTask: URLSessionDataTask, didReceive data: Data) {
        store.perform { [weak self] _ in
            guard let self,
                  let entity = getEntity(from: dataTask),
                  let response = entity.response,
                  HTTPMimeType.acceptableMimeTypes.contains(where: {
                      guard let mimeType = response.mimeType else { return false }
                      return $0 == mimeType
                  })
            else { return }

            response.rawHTTPBody.append(data)
        }
    }

    func log(_ dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, cachedURLResponse: CachedURLResponse?) {}
}
