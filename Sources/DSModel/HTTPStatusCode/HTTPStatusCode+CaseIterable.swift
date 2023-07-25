//
//  HTTPStatusCode+CaseIterable.swift
//  DSModel
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

// MARK: CaseIterable

extension HTTPStatusCode: CaseIterable {
    public static var allCases: [Self] {
        return [
            // Informational -------------
            .continue,
            .switchingProtocols,
            .processing,
            .earlyHints,
            // ---------------------------

            // Successful ----------------
            .ok,
            .created,
            .accepted,
            .nonAuthoritativeInformation,
            .noContent,
            .resetContent,
            .partialContent,
            .multiStatus,
            .alreadyReported,
            .imUsed,
            // ---------------------------

            // Redirection ---------------
            .multipleChoices,
            .movedPermanently,
            .found,
            .seeOther,
            .notModified,
            .useProxy,
            .unused,
            .temporaryRedirect,
            .permanentRedirect,
            // ---------------------------

            // Client Error --------------
            .badRequest,
            .unauthorized,
            .paymentRequired,
            .forbidden,
            .notFound,
            .methodNotAllowed,
            .notAcceptable,
            .proxyAuthenticationRequired,
            .requestTimeout,
            .conflict,
            .gone,
            .lengthRequired,
            .preconditionFailed,
            .payloadTooLarge,
            .uriTooLong,
            .unsupportedMediaType,
            .rangeNotSatisfiable,
            .expectationFailed,
            .imATeapot,
            .misdirectedRequest,
            .unprocessableEntity,
            .locked,
            .failedDependency,
            .tooEarly,
            .upgradeRequired,
            .preconditionRequired,
            .tooManyRequests,
            .requestHeaderFieldsTooLarge,
            .unavailableForLegalReasons,
            // ---------------------------

            // Server Error --------------
            .internalServerError,
            .notImplemented,
            .badGateway,
            .serviceUnavailable,
            .gatewayTimeout,
            .httpVersionNotSupported,
            .variantAlsoNegotiates,
            .insufficientStorage,
            .loopDetected,
            .notExtended,
            .networkAuthenticationRequired
            // ---------------------------
        ]
    }
}
