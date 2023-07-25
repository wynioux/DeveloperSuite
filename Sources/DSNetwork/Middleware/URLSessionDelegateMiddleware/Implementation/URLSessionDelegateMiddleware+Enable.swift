//
//  URLSessionDelegateMiddleware+Enable.swift
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

// MARK: _init

private extension URLSession {
    @objc class func _init(configuration: URLSessionConfiguration, delegate: URLSessionDelegate?, delegateQueue queue: OperationQueue?) -> URLSession {
        return _init(configuration: configuration, delegate: URLSessionDelegateMiddleware(urlSessionDelegate: delegate), delegateQueue: queue)
    }
}

// MARK: Enable

public extension URLSessionDelegateMiddleware {
    static func enable() {
        guard let original = class_getClassMethod(URLSession.self, #selector(URLSession.init(configuration:delegate:delegateQueue:))),
              let proxy = class_getClassMethod(URLSession.self, #selector(URLSession._init(configuration:delegate:delegateQueue:)))
        else { return }

        method_exchangeImplementations(original, proxy)
    }
}
