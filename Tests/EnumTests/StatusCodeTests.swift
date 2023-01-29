//
//  StatusCodeTests.swift
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

// MARK: StatusCodeTests

final class StatusCodeTests: XCTestCase {
    // MARK: - test_rawValue

    func test_rawValue() {
        // swiftformat:disable all
        // Informational -----------------------------------------------------
        XCTAssertEqual(StatusCode.continue.rawValue,                      100)
        XCTAssertEqual(StatusCode.switchingProtocols.rawValue,            101)
        XCTAssertEqual(StatusCode.processing.rawValue,                    102)
        XCTAssertEqual(StatusCode.earlyHints.rawValue,                    103)
        // -------------------------------------------------------------------
        
        // Successful --------------------------------------------------------
        XCTAssertEqual(StatusCode.ok.rawValue,                            200)
        XCTAssertEqual(StatusCode.created.rawValue,                       201)
        XCTAssertEqual(StatusCode.accepted.rawValue,                      202)
        XCTAssertEqual(StatusCode.nonAuthoritativeInformation.rawValue,   203)
        XCTAssertEqual(StatusCode.noContent.rawValue,                     204)
        XCTAssertEqual(StatusCode.resetContent.rawValue,                  205)
        XCTAssertEqual(StatusCode.partialContent.rawValue,                206)
        XCTAssertEqual(StatusCode.multiStatus.rawValue,                   207)
        XCTAssertEqual(StatusCode.alreadyReported.rawValue,               208)
        XCTAssertEqual(StatusCode.imUsed.rawValue,                        226)
        // -------------------------------------------------------------------
        
        // Redirection -------------------------------------------------------
        XCTAssertEqual(StatusCode.multipleChoices.rawValue,               300)
        XCTAssertEqual(StatusCode.movedPermanently.rawValue,              301)
        XCTAssertEqual(StatusCode.found.rawValue,                         302)
        XCTAssertEqual(StatusCode.seeOther.rawValue,                      303)
        XCTAssertEqual(StatusCode.notModified.rawValue,                   304)
        XCTAssertEqual(StatusCode.useProxy.rawValue,                      305)
        XCTAssertEqual(StatusCode.unused.rawValue,                        306)
        XCTAssertEqual(StatusCode.temporaryRedirect.rawValue,             307)
        XCTAssertEqual(StatusCode.permanentRedirect.rawValue,             308)
        // -------------------------------------------------------------------
        
        // Client Error ------------------------------------------------------
        XCTAssertEqual(StatusCode.badRequest.rawValue,                    400)
        XCTAssertEqual(StatusCode.unauthorized.rawValue,                  401)
        XCTAssertEqual(StatusCode.paymentRequired.rawValue,               402)
        XCTAssertEqual(StatusCode.forbidden.rawValue,                     403)
        XCTAssertEqual(StatusCode.notFound.rawValue,                      404)
        XCTAssertEqual(StatusCode.methodNotAllowed.rawValue,              405)
        XCTAssertEqual(StatusCode.notAcceptable.rawValue,                 406)
        XCTAssertEqual(StatusCode.proxyAuthenticationRequired.rawValue,   407)
        XCTAssertEqual(StatusCode.requestTimeout.rawValue,                408)
        XCTAssertEqual(StatusCode.conflict.rawValue,                      409)
        XCTAssertEqual(StatusCode.gone.rawValue,                          410)
        XCTAssertEqual(StatusCode.lengthRequired.rawValue,                411)
        XCTAssertEqual(StatusCode.preconditionFailed.rawValue,            412)
        XCTAssertEqual(StatusCode.payloadTooLarge.rawValue,               413)
        XCTAssertEqual(StatusCode.uriTooLong.rawValue,                    414)
        XCTAssertEqual(StatusCode.unsupportedMediaType.rawValue,          415)
        XCTAssertEqual(StatusCode.rangeNotSatisfiable.rawValue,           416)
        XCTAssertEqual(StatusCode.expectationFailed.rawValue,             417)
        XCTAssertEqual(StatusCode.imATeapot.rawValue,                     418)
        XCTAssertEqual(StatusCode.misdirectedRequest.rawValue,            421)
        XCTAssertEqual(StatusCode.unprocessableEntity.rawValue,           422)
        XCTAssertEqual(StatusCode.locked.rawValue,                        423)
        XCTAssertEqual(StatusCode.failedDependency.rawValue,              424)
        XCTAssertEqual(StatusCode.tooEarly.rawValue,                      425)
        XCTAssertEqual(StatusCode.upgradeRequired.rawValue,               426)
        XCTAssertEqual(StatusCode.preconditionRequired.rawValue,          428)
        XCTAssertEqual(StatusCode.tooManyRequests.rawValue,               429)
        XCTAssertEqual(StatusCode.requestHeaderFieldsTooLarge.rawValue,   431)
        XCTAssertEqual(StatusCode.unavailableForLegalReasons.rawValue,    451)
        // -------------------------------------------------------------------
        
        // Server Error ------------------------------------------------------
        XCTAssertEqual(StatusCode.internalServerError.rawValue,           500)
        XCTAssertEqual(StatusCode.notImplemented.rawValue,                501)
        XCTAssertEqual(StatusCode.badGateway.rawValue,                    502)
        XCTAssertEqual(StatusCode.serviceUnavailable.rawValue,            503)
        XCTAssertEqual(StatusCode.gatewayTimeout.rawValue,                504)
        XCTAssertEqual(StatusCode.httpVersionNotSupported.rawValue,       505)
        XCTAssertEqual(StatusCode.variantAlsoNegotiates.rawValue,         506)
        XCTAssertEqual(StatusCode.insufficientStorage.rawValue,           507)
        XCTAssertEqual(StatusCode.loopDetected.rawValue,                  508)
        XCTAssertEqual(StatusCode.notExtended.rawValue,                   510)
        XCTAssertEqual(StatusCode.networkAuthenticationRequired.rawValue, 511)
        // -------------------------------------------------------------------
        
        // Unknown -----------------------------------------------------------
        XCTAssertEqual(StatusCode.unknown(599).rawValue,                  599)
        // -------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValue

    func test_initWithRawValue() {
        // swiftformat:disable all
        // Informational ------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 100), StatusCode.continue)
        XCTAssertEqual(StatusCode(rawValue: 101), StatusCode.switchingProtocols)
        XCTAssertEqual(StatusCode(rawValue: 102), StatusCode.processing)
        XCTAssertEqual(StatusCode(rawValue: 103), StatusCode.earlyHints)
        // --------------------------------------------------------------------------------
        
        // Successful ---------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 200), StatusCode.ok)
        XCTAssertEqual(StatusCode(rawValue: 201), StatusCode.created)
        XCTAssertEqual(StatusCode(rawValue: 202), StatusCode.accepted)
        XCTAssertEqual(StatusCode(rawValue: 203), StatusCode.nonAuthoritativeInformation)
        XCTAssertEqual(StatusCode(rawValue: 204), StatusCode.noContent)
        XCTAssertEqual(StatusCode(rawValue: 205), StatusCode.resetContent)
        XCTAssertEqual(StatusCode(rawValue: 206), StatusCode.partialContent)
        XCTAssertEqual(StatusCode(rawValue: 207), StatusCode.multiStatus)
        XCTAssertEqual(StatusCode(rawValue: 208), StatusCode.alreadyReported)
        XCTAssertEqual(StatusCode(rawValue: 226), StatusCode.imUsed)
        // --------------------------------------------------------------------------------
        
        // Redirection --------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 300), StatusCode.multipleChoices)
        XCTAssertEqual(StatusCode(rawValue: 301), StatusCode.movedPermanently)
        XCTAssertEqual(StatusCode(rawValue: 302), StatusCode.found)
        XCTAssertEqual(StatusCode(rawValue: 303), StatusCode.seeOther)
        XCTAssertEqual(StatusCode(rawValue: 304), StatusCode.notModified)
        XCTAssertEqual(StatusCode(rawValue: 305), StatusCode.useProxy)
        XCTAssertEqual(StatusCode(rawValue: 306), StatusCode.unused)
        XCTAssertEqual(StatusCode(rawValue: 307), StatusCode.temporaryRedirect)
        XCTAssertEqual(StatusCode(rawValue: 308), StatusCode.permanentRedirect)
        // --------------------------------------------------------------------------------
        
        // Client Error -------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 400), StatusCode.badRequest)
        XCTAssertEqual(StatusCode(rawValue: 401), StatusCode.unauthorized)
        XCTAssertEqual(StatusCode(rawValue: 402), StatusCode.paymentRequired)
        XCTAssertEqual(StatusCode(rawValue: 403), StatusCode.forbidden)
        XCTAssertEqual(StatusCode(rawValue: 404), StatusCode.notFound)
        XCTAssertEqual(StatusCode(rawValue: 405), StatusCode.methodNotAllowed)
        XCTAssertEqual(StatusCode(rawValue: 406), StatusCode.notAcceptable)
        XCTAssertEqual(StatusCode(rawValue: 407), StatusCode.proxyAuthenticationRequired)
        XCTAssertEqual(StatusCode(rawValue: 408), StatusCode.requestTimeout)
        XCTAssertEqual(StatusCode(rawValue: 409), StatusCode.conflict)
        XCTAssertEqual(StatusCode(rawValue: 410), StatusCode.gone)
        XCTAssertEqual(StatusCode(rawValue: 411), StatusCode.lengthRequired)
        XCTAssertEqual(StatusCode(rawValue: 412), StatusCode.preconditionFailed)
        XCTAssertEqual(StatusCode(rawValue: 413), StatusCode.payloadTooLarge)
        XCTAssertEqual(StatusCode(rawValue: 414), StatusCode.uriTooLong)
        XCTAssertEqual(StatusCode(rawValue: 415), StatusCode.unsupportedMediaType)
        XCTAssertEqual(StatusCode(rawValue: 416), StatusCode.rangeNotSatisfiable)
        XCTAssertEqual(StatusCode(rawValue: 417), StatusCode.expectationFailed)
        XCTAssertEqual(StatusCode(rawValue: 418), StatusCode.imATeapot)
        XCTAssertEqual(StatusCode(rawValue: 421), StatusCode.misdirectedRequest)
        XCTAssertEqual(StatusCode(rawValue: 422), StatusCode.unprocessableEntity)
        XCTAssertEqual(StatusCode(rawValue: 423), StatusCode.locked)
        XCTAssertEqual(StatusCode(rawValue: 424), StatusCode.failedDependency)
        XCTAssertEqual(StatusCode(rawValue: 425), StatusCode.tooEarly)
        XCTAssertEqual(StatusCode(rawValue: 426), StatusCode.upgradeRequired)
        XCTAssertEqual(StatusCode(rawValue: 428), StatusCode.preconditionRequired)
        XCTAssertEqual(StatusCode(rawValue: 429), StatusCode.tooManyRequests)
        XCTAssertEqual(StatusCode(rawValue: 431), StatusCode.requestHeaderFieldsTooLarge)
        XCTAssertEqual(StatusCode(rawValue: 451), StatusCode.unavailableForLegalReasons)
        // --------------------------------------------------------------------------------
        
        // Server Error -------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 500), StatusCode.internalServerError)
        XCTAssertEqual(StatusCode(rawValue: 501), StatusCode.notImplemented)
        XCTAssertEqual(StatusCode(rawValue: 502), StatusCode.badGateway)
        XCTAssertEqual(StatusCode(rawValue: 503), StatusCode.serviceUnavailable)
        XCTAssertEqual(StatusCode(rawValue: 504), StatusCode.gatewayTimeout)
        XCTAssertEqual(StatusCode(rawValue: 505), StatusCode.httpVersionNotSupported)
        XCTAssertEqual(StatusCode(rawValue: 506), StatusCode.variantAlsoNegotiates)
        XCTAssertEqual(StatusCode(rawValue: 507), StatusCode.insufficientStorage)
        XCTAssertEqual(StatusCode(rawValue: 508), StatusCode.loopDetected)
        XCTAssertEqual(StatusCode(rawValue: 510), StatusCode.notExtended)
        XCTAssertEqual(StatusCode(rawValue: 511), StatusCode.networkAuthenticationRequired)
        // --------------------------------------------------------------------------------
        
        // Unknown ------------------------------------------------------------------------
        XCTAssertEqual(StatusCode(rawValue: 599), StatusCode.unknown(599))
        // --------------------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValueOutOfRange

    func test_initWithRawValueOutOfRange() {
        let rawValueTooLow = StatusCode(rawValue: 99)
        XCTAssertNil(rawValueTooLow, "Expected to be nil as it is lower than the minimum HTTP Status Code of 100.")

        let rawValueTooHigh = StatusCode(rawValue: 600)
        XCTAssertNil(rawValueTooHigh, "Expected to be nil as it is higher than the maximum HTTP Status Code of 599.")
    }

    // MARK: - test_equatable

    func test_equatable() {
        // swiftformat:disable all
        let continueCode        = StatusCode.continue
        let continueCodeFromRaw = StatusCode(rawValue: 100)
        // swiftformat:enable all
        XCTAssertEqual(continueCode, continueCodeFromRaw, "Expected to be equal as they both represent the HTTP status code 100.")

        // swiftformat:disable all
        let unknownCode        = StatusCode.unknown(599)
        let unknownCodeFromRaw = StatusCode(rawValue: 599)
        // swiftformat:enable all
        XCTAssertEqual(unknownCode, unknownCodeFromRaw, "Expected to be equal as they both represent the unknown HTTP status code 599.")
    }
}
