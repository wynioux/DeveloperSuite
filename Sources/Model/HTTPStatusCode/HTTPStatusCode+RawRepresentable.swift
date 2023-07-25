//
//  HTTPStatusCode+RawRepresentable.swift
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

// MARK: RawRepresentable

extension HTTPStatusCode: RawRepresentable {
    public typealias RawValue = Int

    // MARK: - init

    public init?(rawValue: Int) {
        guard rawValue > 99,
              rawValue < 600
        else { return nil }
        
        switch rawValue {
        // swiftformat:disable all
        // Informational ------------------------------
        case 100: self = .continue
        case 101: self = .switchingProtocols
        case 102: self = .processing
        case 103: self = .earlyHints
        // --------------------------------------------
            
        // Successful ---------------------------------
        case 200: self = .ok
        case 201: self = .created
        case 202: self = .accepted
        case 203: self = .nonAuthoritativeInformation
        case 204: self = .noContent
        case 205: self = .resetContent
        case 206: self = .partialContent
        case 207: self = .multiStatus
        case 208: self = .alreadyReported
        case 226: self = .imUsed
        // --------------------------------------------
            
        // Redirection --------------------------------
        case 300: self = .multipleChoices
        case 301: self = .movedPermanently
        case 302: self = .found
        case 303: self = .seeOther
        case 304: self = .notModified
        case 305: self = .useProxy
        case 306: self = .unused
        case 307: self = .temporaryRedirect
        case 308: self = .permanentRedirect
        // --------------------------------------------
            
        // Client Error -------------------------------
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 402: self = .paymentRequired
        case 403: self = .forbidden
        case 404: self = .notFound
        case 405: self = .methodNotAllowed
        case 406: self = .notAcceptable
        case 407: self = .proxyAuthenticationRequired
        case 408: self = .requestTimeout
        case 409: self = .conflict
        case 410: self = .gone
        case 411: self = .lengthRequired
        case 412: self = .preconditionFailed
        case 413: self = .payloadTooLarge
        case 414: self = .uriTooLong
        case 415: self = .unsupportedMediaType
        case 416: self = .rangeNotSatisfiable
        case 417: self = .expectationFailed
        case 418: self = .imATeapot
        case 421: self = .misdirectedRequest
        case 422: self = .unprocessableEntity
        case 423: self = .locked
        case 424: self = .failedDependency
        case 425: self = .tooEarly
        case 426: self = .upgradeRequired
        case 428: self = .preconditionRequired
        case 429: self = .tooManyRequests
        case 431: self = .requestHeaderFieldsTooLarge
        case 451: self = .unavailableForLegalReasons
        // --------------------------------------------
            
        // Server Error -------------------------------
        case 500: self = .internalServerError
        case 501: self = .notImplemented
        case 502: self = .badGateway
        case 503: self = .serviceUnavailable
        case 504: self = .gatewayTimeout
        case 505: self = .httpVersionNotSupported
        case 506: self = .variantAlsoNegotiates
        case 507: self = .insufficientStorage
        case 508: self = .loopDetected
        case 510: self = .notExtended
        case 511: self = .networkAuthenticationRequired
        // --------------------------------------------
            
        // Unknown ------------------------------------
        default:  self = .unknown(rawValue)
        // --------------------------------------------
        // swiftformat:enable all
        }
    }

    // MARK: - rawValue

    public var rawValue: Int {
        switch self {
        // swiftformat:disable all
        // Informational -----------------------------------
        case .continue:                      return 100
        case .switchingProtocols:            return 101
        case .processing:                    return 102
        case .earlyHints:                    return 103
        // -------------------------------------------------
            
        // Successful --------------------------------------
        case .ok:                            return 200
        case .created:                       return 201
        case .accepted:                      return 202
        case .nonAuthoritativeInformation:   return 203
        case .noContent:                     return 204
        case .resetContent:                  return 205
        case .partialContent:                return 206
        case .multiStatus:                   return 207
        case .alreadyReported:               return 208
        case .imUsed:                        return 226
        // -------------------------------------------------
            
        // Redirection -------------------------------------
        case .multipleChoices:               return 300
        case .movedPermanently:              return 301
        case .found:                         return 302
        case .seeOther:                      return 303
        case .notModified:                   return 304
        case .useProxy:                      return 305
        case .unused:                        return 306
        case .temporaryRedirect:             return 307
        case .permanentRedirect:             return 308
        // -------------------------------------------------
            
        // Client Error ------------------------------------
        case .badRequest:                    return 400
        case .unauthorized:                  return 401
        case .paymentRequired:               return 402
        case .forbidden:                     return 403
        case .notFound:                      return 404
        case .methodNotAllowed:              return 405
        case .notAcceptable:                 return 406
        case .proxyAuthenticationRequired:   return 407
        case .requestTimeout:                return 408
        case .conflict:                      return 409
        case .gone:                          return 410
        case .lengthRequired:                return 411
        case .preconditionFailed:            return 412
        case .payloadTooLarge:               return 413
        case .uriTooLong:                    return 414
        case .unsupportedMediaType:          return 415
        case .rangeNotSatisfiable:           return 416
        case .expectationFailed:             return 417
        case .imATeapot:                     return 418
        case .misdirectedRequest:            return 421
        case .unprocessableEntity:           return 422
        case .locked:                        return 423
        case .failedDependency:              return 424
        case .tooEarly:                      return 425
        case .upgradeRequired:               return 426
        case .preconditionRequired:          return 428
        case .tooManyRequests:               return 429
        case .requestHeaderFieldsTooLarge:   return 431
        case .unavailableForLegalReasons:    return 451
        // -------------------------------------------------
            
        // Server Error ------------------------------------
        case .internalServerError:           return 500
        case .notImplemented:                return 501
        case .badGateway:                    return 502
        case .serviceUnavailable:            return 503
        case .gatewayTimeout:                return 504
        case .httpVersionNotSupported:       return 505
        case .variantAlsoNegotiates:         return 506
        case .insufficientStorage:           return 507
        case .loopDetected:                  return 508
        case .notExtended:                   return 510
        case .networkAuthenticationRequired: return 511
        // -------------------------------------------------
            
        // Unknown -----------------------------------------
        case .unknown(let rawValue):         return rawValue
        // -------------------------------------------------
        // swiftformat:enable all
        }
    }
}
