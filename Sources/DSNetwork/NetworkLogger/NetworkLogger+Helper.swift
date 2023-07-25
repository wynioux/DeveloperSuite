//
//  NetworkLogger+Helper.swift
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

// MARK: Helper

extension NetworkLogger {
    func getEntity(from task: URLSessionTask) -> NetworkEntity? {
        return try? store.first(NetworkEntity.self, by: task.uuid())
    }

    func createEntityIfNecessary(from task: URLSessionTask) {
        let id = task.uuid()

        store.perform { [weak self] context in
            guard let self,
                  getEntity(from: task) == nil
            else { return }

            guard let originalRequest = task.originalRequest,
                  let currentRequest = task.currentRequest
            else { return }

            NetworkEntity(
                context: context,
                id: id,
                state: .pending,
                originalRequest: .init(
                    context: context,
                    request: originalRequest
                ),
                currentRequest: .init(
                    context: context,
                    request: currentRequest
                )
            )
        }
    }
}
