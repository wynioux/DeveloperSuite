//
//  MethodTests.swift
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

@testable import DeveloperSuite
import XCTest

// MARK: MethodTests

final class MethodTests: XCTestCase {
    // MARK: - test_rawValue

    func test_rawValue() {
        // swiftformat:disable all
        // Regular -----------------------------------------------------
        XCTAssertEqual(Method.get.rawValue,             "GET")
        XCTAssertEqual(Method.head.rawValue,            "HEAD")
        XCTAssertEqual(Method.post.rawValue,            "POST")
        XCTAssertEqual(Method.put.rawValue,             "PUT")
        XCTAssertEqual(Method.delete.rawValue,          "DELETE")
        XCTAssertEqual(Method.connect.rawValue,         "CONNECT")
        XCTAssertEqual(Method.options.rawValue,         "OPTIONS")
        XCTAssertEqual(Method.trace.rawValue,           "TRACE")
        XCTAssertEqual(Method.patch.rawValue,           "PATCH")
        // -------------------------------------------------------------
            
        // Unknown -----------------------------------------------------
        XCTAssertEqual(Method.unknown("FOO").rawValue, "FOO")
        // -------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValue

    func test_initWithRawValue() {
        // swiftformat:disable all
        // Regular -------------------------------------------------------
        XCTAssertEqual(Method(rawValue: "GET"),     Method.get)
        XCTAssertEqual(Method(rawValue: "HEAD"),    Method.head)
        XCTAssertEqual(Method(rawValue: "POST"),    Method.post)
        XCTAssertEqual(Method(rawValue: "PUT"),     Method.put)
        XCTAssertEqual(Method(rawValue: "DELETE"),  Method.delete)
        XCTAssertEqual(Method(rawValue: "CONNECT"), Method.connect)
        XCTAssertEqual(Method(rawValue: "OPTIONS"), Method.options)
        XCTAssertEqual(Method(rawValue: "TRACE"),   Method.trace)
        XCTAssertEqual(Method(rawValue: "PATCH"),   Method.patch)
        // ---------------------------------------------------------------
            
        // Unknown -------------------------------------------------------
        XCTAssertEqual(Method(rawValue: "FOO"),     Method.unknown("FOO"))
        // ---------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValueWithWhitespaces

    func test_initWithRawValueWithWhitespaces() {
        XCTAssertEqual(Method(rawValue: "GET "), Method.get, "String with trailing spaces should be handled.")
        XCTAssertEqual(Method(rawValue: " GET"), Method.get, "String with leading spaces should be handled.")
    }

    // MARK: - test_initWithRawValueWithEmptyString

    func test_initWithRawValueWithEmptyString() {
        XCTAssertNil(Method(rawValue: ""), "Empty string should return nil.")
        XCTAssertNil(Method(rawValue: " "), "String with only spaces should return nil.")
    }

    // MARK: - test_equatable

    func test_equatable() {
        // swiftformat:disable all
        let getMethod        = Method.get
        let getMethodFromRaw = Method(rawValue: "GET")
        // swiftformat:enable all
        XCTAssertEqual(getMethod, getMethodFromRaw, "Expected to be equal as they both represent the HTTP method GET.")

        // swiftformat:disable all
        let unknownMethod        = Method.unknown("FOO")
        let unknownMethodFromRaw = Method(rawValue: "FOO")
        // swiftformat:enable all
        XCTAssertEqual(unknownMethod, unknownMethodFromRaw, "Expected to be equal as they both represent the unknown HTTP method FOO.")
    }
}
