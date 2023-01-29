//
//  Method.swift
//  DeveloperSuite
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

// MARK: Method

/**
 HTTP defines a set of **request methods** to indicate the desired action to be performed for a given resource.
 
 Although they can also be nouns, these request methods are sometimes referred to as HTTP verbs. Each of them implements a different semantic, but some common features are shared by a group of them: e.g. a request method can be [safe](https://developer.mozilla.org/en-US/docs/Glossary/Safe/HTTP), [idempotent](https://developer.mozilla.org/en-US/docs/Glossary/Idempotent), or [cacheable](https://developer.mozilla.org/en-US/docs/Glossary/Cacheable).
 */
enum Method {
    // MARK: - Regular

    /**
     Requests a representation of the specified resource. Requests using GET should only retrieve data.
     */
    case get
    
    /**
     Asks for a response identical to a GET request, but without the response body.
     */
    case head
    
    /**
     Submits an entity to the specified resource, often causing a change in state or side effects on the server.
     */
    case post
    
    /**
     Replaces all current representations of the target resource with the request payload.
     */
    case put
    
    /**
     Deletes the specified resource.
     */
    case delete
    
    /**
     Establishes a tunnel to the server identified by the target resource.
     */
    case connect
    
    /**
     Describes the communication options for the target resource.
     */
    case options
    
    /**
     Performs a message loop-back test along the path to the target resource.
     */
    case trace
    
    /**
     Applies partial modifications to a resource.
     */
    case patch
    
    // MARK: - Unknown

    /**
     Unknown case
     */
    case unknown(String)
}
