//
//  HTTPStatusCode+Title.swift
//  Model
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

// MARK: Title

public extension HTTPStatusCode {
    var title: String {
        switch self {
        // swiftformat:disable all
        // Informational ------------------------------------------------------------
        case .continue:                      return "Continue"
        case .switchingProtocols:            return "Switching Protocols"
        case .processing:                    return "Processing"
        case .earlyHints:                    return "Early Hints"
        // --------------------------------------------------------------------------
            
        // Successful ---------------------------------------------------------------
        case .ok:                            return "OK"
        case .created:                       return "Created"
        case .accepted:                      return "Accepted"
        case .nonAuthoritativeInformation:   return "Non-Authoritative Information"
        case .noContent:                     return "No Content"
        case .resetContent:                  return "Reset Content"
        case .partialContent:                return "Partial Content"
        case .multiStatus:                   return "Multi Status"
        case .alreadyReported:               return "Already Reported"
        case .imUsed:                        return "I'm Used"
        // --------------------------------------------------------------------------
            
        // Redirection --------------------------------------------------------------
        case .multipleChoices:               return "Multiple Choices"
        case .movedPermanently:              return "Moved Permanently"
        case .found:                         return "Found"
        case .seeOther:                      return "See Other"
        case .notModified:                   return "Not Modified"
        case .useProxy:                      return "Use Proxy"
        case .unused:                        return "Unused"
        case .temporaryRedirect:             return "Temporary Redirect"
        case .permanentRedirect:             return "Permanent Redirect"
        // --------------------------------------------------------------------------
            
        // Client Error -------------------------------------------------------------
        case .badRequest:                    return "Bad Request"
        case .unauthorized:                  return "Unauthorized"
        case .paymentRequired:               return "Payment Required"
        case .forbidden:                     return "Forbidden"
        case .notFound:                      return "Not Found"
        case .methodNotAllowed:              return "Method Not Allowed"
        case .notAcceptable:                 return "Not Acceptable"
        case .proxyAuthenticationRequired:   return "Proxy Authentication Required"
        case .requestTimeout:                return "Request Timeout"
        case .conflict:                      return "Conflict"
        case .gone:                          return "Gone"
        case .lengthRequired:                return "Length Required"
        case .preconditionFailed:            return "Precondition Failed"
        case .payloadTooLarge:               return "Payload Too Large"
        case .uriTooLong:                    return "URI Too Long"
        case .unsupportedMediaType:          return "Unsupported Media Type"
        case .rangeNotSatisfiable:           return "Range Not Satisfiable"
        case .expectationFailed:             return "Expectation Failed"
        case .imATeapot:                     return "I'm a Teapot"
        case .misdirectedRequest:            return "Misdirected Request"
        case .unprocessableEntity:           return "Unprocessable Entity"
        case .locked:                        return "Locked"
        case .failedDependency:              return "Failed Dependency"
        case .tooEarly:                      return "Too Early"
        case .upgradeRequired:               return "Upgrade Required"
        case .preconditionRequired:          return "Precondition Required"
        case .tooManyRequests:               return "Too Many Requests"
        case .requestHeaderFieldsTooLarge:   return "Request Header Fields Too Large"
        case .unavailableForLegalReasons:    return "Unavailable For Legal Reasons"
        // --------------------------------------------------------------------------
            
        // Server Error -------------------------------------------------------------
        case .internalServerError:           return "Internal Server Error"
        case .notImplemented:                return "Not Implemented"
        case .badGateway:                    return "Bad Gateway"
        case .serviceUnavailable:            return "Service Unavailable"
        case .gatewayTimeout:                return "Gateway Timeout"
        case .httpVersionNotSupported:       return "HTTP Version Not Supported"
        case .variantAlsoNegotiates:         return "Variant Also Negotiates"
        case .insufficientStorage:           return "Insufficient Storage"
        case .loopDetected:                  return "Loop Detected"
        case .notExtended:                   return "Not Extended"
        case .networkAuthenticationRequired: return "Network Authentication Required"
        // --------------------------------------------------------------------------
            
        // Unknown ------------------------------------------------------------------
        case .unknown:                       return "Unknown"
        // --------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }
}
