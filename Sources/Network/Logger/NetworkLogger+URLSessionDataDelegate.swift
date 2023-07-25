//
//  NetworkLogger+URLSessionDataDelegate.swift
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
import Model

// MARK: URLSessionDataDelegate

extension NetworkLogger {
    static func log(_ dataTask: URLSessionDataTask, didReceive response: URLResponse, responseDisposition: URLSession.ResponseDisposition) {
        _debug()

        createEntityIfNecessary(from: dataTask)

        store.perform { context in
            guard let entity = getEntity(from: dataTask) else { return }

            entity.response = .init(context: context, response: response)
        }
    }

    static func log(_ dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {
        _debug()
    }

    static func log(_ dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask) {
        _debug()
    }

    static func log(_ dataTask: URLSessionDataTask, didReceive data: Data) {
        _debug()

        store.perform { _ in
            guard let entity = getEntity(from: dataTask),
                  let response = entity.response,
                  HTTPMimeType.acceptableMimeTypes.contains(where: {
                      guard let mimeType = response.mimeType else { return false }
                      return $0 == mimeType
                  })
            else { return }

            response.rawHTTPBody.append(data)
        }
    }

    static func log(_ dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, cachedURLResponse: CachedURLResponse?) {
        _debug()
    }
}
