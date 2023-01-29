//
//  Header+RawRepresentable.swift
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

extension Header: RawRepresentable {
    typealias RawValue = String

    // MARK: init

    public init?(rawValue: String) {
        let trimmedRawValue = rawValue
            .trimmingCharacters(in: .whitespaces)

        guard !trimmedRawValue.isEmpty else { return nil }

        switch trimmedRawValue {
        // swiftformat:disable all
        // Authentication -----------------------------------------------------------------------
        case "WWW-Authenticate":                    self = .authenticate
        case "Authorization":                       self = .authorization
        case "Proxy-Authenticate":                  self = .proxyAuthenticate
        case "Proxy-Authorization":                 self = .proxyAuthorization
        // --------------------------------------------------------------------------------------

        // Caching ------------------------------------------------------------------------------
        case "Age":                                 self = .age
        case "Cache-Control":                       self = .cacheControl
        case "Clear-Site-Data":                     self = .clearSiteData
        case "Expires":                             self = .expires
        case "Pragma":                              self = .pragma
        case "Warning":                             self = .warning
        // --------------------------------------------------------------------------------------

        // Client Hints -------------------------------------------------------------------------
        case "Accept-CH":                           self = .acceptClientHint
        case "Accept-CH-Lifetime":                  self = .acceptClientHintLifetime
        case "Critical-CH":                         self = .criticalClientHint
        case "Sec-CH-Prefers-Reduced-Motion":       self = .secClientHintPrefersReducedMotion
        case "Sec-CH-UA":                           self = .secClientHintUserAgent
        case "Sec-CH-UA-Arch":                      self = .secClientHintUserAgentArch
        case "Sec-CH-UA-Bitness":                   self = .secClientHintUserAgentBitness
        case "Sec-CH-UA-Full-Version":              self = .secClientHintUserAgentFullVersion
        case "Sec-CH-UA-Full-Version-List":         self = .secClientHintUserAgentFullVersionList
        case "Sec-CH-UA-Mobile":                    self = .secClientHintUserAgentMobile
        case "Sec-CH-UA-Model":                     self = .secClientHintUserAgentModel
        case "Sec-CH-UA-Platform":                  self = .secClientHintUserAgentPlatform
        case "Sec-CH-UA-Platform-Version":          self = .secClientHintUserAgentPlatformVersion
        case "Content-DPR":                         self = .contentDevicePixelRatio
        case "Device-Memory":                       self = .deviceMemory
        case "DPR":                                 self = .devicePixelRatio
        case "Viewport-Width":                      self = .viewportWidth
        case "Width":                               self = .width
        case "Downlink":                            self = .downlink
        case "ECT":                                 self = .effectiveConnectionType
        case "RTT":                                 self = .roundTripTime
        case "SaveData":                            self = .saveData
        // --------------------------------------------------------------------------------------

        // Conditionals -------------------------------------------------------------------------
        case "Last-Modified":                       self = .lastModified
        case "ETag":                                self = .etag
        case "If-Match":                            self = .ifMatch
        case "If-None-Match":                       self = .ifNoneMatch
        case "If-Modified-Since":                   self = .ifModifiedSince
        case "If-Unmodified-Since":                 self = .ifUnmodifiedSince
        case "Vary":                                self = .vary
        // --------------------------------------------------------------------------------------

        // Connection Management ----------------------------------------------------------------
        case "Connection":                          self = .connection
        case "Keep-Alive":                          self = .keepAlive
        // --------------------------------------------------------------------------------------

        // Content Negotiation ------------------------------------------------------------------
        case "Accept":                              self = .accept
        case "Accept-Encoding":                     self = .acceptEncoding
        case "Accept-Language":                     self = .acceptLanguage
        // --------------------------------------------------------------------------------------

        // Controls -----------------------------------------------------------------------------
        case "Expect":                              self = .expect
        case "Max-Forwards":                        self = .maxForwards
        // --------------------------------------------------------------------------------------

        // Cookies ------------------------------------------------------------------------------
        case "Cookie":                              self = .cookie
        case "Set-Cookie":                          self = .setCookie
        // --------------------------------------------------------------------------------------

        // CORS ---------------------------------------------------------------------------------
        case "Access-Control-Allow-Origin":         self = .accessControlAllowOrigin
        case "Access-Control-Allow-Credentials":    self = .accessControlAllowCredentials
        case "Access-Control-Allow-Headers":        self = .accessControlAllowHeaders
        case "Access-Control-Allow-Methods":        self = .accessControlAllowMethods
        case "Access-Control-Expose-Headers":       self = .accessControlExposeHeaders
        case "Access-Control-Max-Age":              self = .accessControlMaxAge
        case "Access-Control-Request-Headers":      self = .accessControlRequestHeaders
        case "Access-Control-Request-Method":       self = .accessControlRequestMethod
        case "Origin":                              self = .origin
        case "Timing-Allow-Origin":                 self = .timingAllowOrigin
        // --------------------------------------------------------------------------------------

        // Downloads ----------------------------------------------------------------------------
        case "Content-Disposition":                 self = .contentDisposition
        // --------------------------------------------------------------------------------------

        // Message Body Information -------------------------------------------------------------
        case "Content-Length":                      self = .contentLength
        case "Content-Type":                        self = .contentType
        case "Content-Encoding":                    self = .contentEncoding
        case "Content-Language":                    self = .contentLanguage
        case "Content-Location":                    self = .contentLocation
        // --------------------------------------------------------------------------------------

        // Proxies ------------------------------------------------------------------------------
        case "Forwarded":                           self = .forwarded
        case "X-Forwarded-For":                     self = .xForwardedFor
        case "X-Forwarded-Host":                    self = .xForwardedHost
        case "X-Forwarded-Proto":                   self = .xForwardedProto
        case "Via":                                 self = .via
        // --------------------------------------------------------------------------------------

        // Redirects ----------------------------------------------------------------------------
        case "Location":                            self = .location
        case "Refresh":                             self = .refresh
        // --------------------------------------------------------------------------------------

        // Request Context ----------------------------------------------------------------------
        case "From":                                self = .from
        case "Host":                                self = .host
        case "Referer":                             self = .referer
        case "Referrer-Policy":                     self = .referrerPolicy
        case "User-Agent":                          self = .userAgent
        // --------------------------------------------------------------------------------------

        // Response Context ---------------------------------------------------------------------
        case "Allow":                               self = .allow
        case "Server":                              self = .server
        // --------------------------------------------------------------------------------------

        // Range Requests -----------------------------------------------------------------------
        case "Accept-Ranges":                       self = .acceptRanges
        case "Range":                               self = .range
        case "If-Range":                            self = .ifRange
        case "Content-Range":                       self = .contentRange
        // --------------------------------------------------------------------------------------

        // Security -----------------------------------------------------------------------------
        case "Cross-Origin-Embedder-Policy":        self = .crossOriginEmbedderPolicy
        case "Cross-Origin-Opener-Policy":          self = .crossOriginOpenerPolicy
        case "Cross-Origin-Resource-Policy":        self = .crossOriginResourcePolicy
        case "Content-Security-Policy":             self = .contentSecurityPolicy
        case "Content-Security-Policy-Report-Only": self = .contentSecurityPolicyReportOnly
        case "Expect-CT":                           self = .expectCertificateTransparency
        case "Origin-Isolation":                    self = .originIsolation
        case "Permissions-Policy":                  self = .permissionsPolicy
        case "Strict-Transport-Security":           self = .strictTransportSecurity
        case "Upgrade-Insecure-Requests":           self = .upgradeInsecureRequests
        case "X-Content-Type-Options":              self = .xContentTypeOptions
        case "X-Download-Options":                  self = .xDownloadOptions
        case "X-Frame-Options":                     self = .xFrameOptions
        case "X-Permitted-Cross-Domain-Policies":   self = .xPermittedCrossDomainPolicies
        case "X-Powered-By":                        self = .xPoweredBy
        case "X-XSS-Protection":                    self = .xXSSProtection
        case "Sec-Fetch-Site":                      self = .secFetchSite
        case "Sec-Fetch-Mode":                      self = .secFetchMode
        case "Sec-Fetch-User":                      self = .secFetchUser
        case "Sec-Fetch-Dest":                      self = .secFetchDest
        case "Service-Worker-Navigation-Preload":   self = .serviceWorkerNavigationPreload
        // --------------------------------------------------------------------------------------

        // Server-sent Events -------------------------------------------------------------------
        case "Last-Event-ID":                       self = .lastEventID
        case "NEL":                                 self = .nel
        case "Ping-From":                           self = .pingFrom
        case "Ping-To":                             self = .pingTo
        case "Report-To":                           self = .reportTo
        // --------------------------------------------------------------------------------------

        // Transfer Coding ----------------------------------------------------------------------
        case "Transfer-Encoding":                   self = .transferEncoding
        case "TE":                                  self = .te
        case "Trailer":                             self = .trailer
        // --------------------------------------------------------------------------------------

        // WebSockets ---------------------------------------------------------------------------
        case "Sec-WebSocket-Key":                   self = .secWebSocketKey
        case "Sec-WebSocket-Extensions":            self = .secWebSocketExtensions
        case "Sec-WebSocket-Accept":                self = .secWebSocketAccept
        case "Sec-WebSocket-Protocol":              self = .secWebSocketProtocol
        case "Sec-WebSocket-Version":               self = .secWebSocketVersion
        // --------------------------------------------------------------------------------------

        // Other --------------------------------------------------------------------------------
        case "Accept-Push-Policy":                  self = .acceptPushPolicy
        case "Accept-Signature":                    self = .acceptSignature
        case "Alt-Svc":                             self = .altSvc
        case "Date":                                self = .date
        case "Early-Data":                          self = .earlyData
        case "Large-Allocation":                    self = .largeAllocation
        case "Link":                                self = .link
        case "Push-Policy":                         self = .pushPolicy
        case "Retry-After":                         self = .retryAfter
        case "Signature":                           self = .signature
        case "Signed-Headers":                      self = .signedHeaders
        case "Server-Timing":                       self = .serverTiming
        case "Service-Worker-Allowed":              self = .serviceWorkerAllowed
        case "SourceMap":                           self = .sourceMap
        case "Upgrade":                             self = .upgrade
        case "X-DNS-Prefetch-Control":              self = .xDNSPrefetchControl
        case "X-Firefox-Spdy":                      self = .xFirefoxSpdy
        case "X-Pingback":                          self = .xPingback
        case "X-Requested-With":                    self = .xRequestedWith
        case "X-Robots-Tag":                        self = .xRobotsTag
        case "X-UA-Compatible":                     self = .xUACompatible
        // --------------------------------------------------------------------------------------
            
        // Unknown ------------------------------------------------------------------------------
        default:                                    self = .unknown(trimmedRawValue)
        // --------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }

    // MARK: rawValue

    public var rawValue: String {
        switch self {
        // swiftformat:disable all
        // Authentication -----------------------------------------------------------------------
        case .authenticate:                          return "WWW-Authenticate"
        case .authorization:                         return "Authorization"
        case .proxyAuthenticate:                     return "Proxy-Authenticate"
        case .proxyAuthorization:                    return "Proxy-Authorization"
        // --------------------------------------------------------------------------------------
            
        // Caching ------------------------------------------------------------------------------
        case .age:                                   return "Age"
        case .cacheControl:                          return "Cache-Control"
        case .clearSiteData:                         return "Clear-Site-Data"
        case .expires:                               return "Expires"
        case .pragma:                                return "Pragma"
        case .warning:                               return "Warning"
        // --------------------------------------------------------------------------------------
        
        // Client Hints -------------------------------------------------------------------------
        case .acceptClientHint:                      return "Accept-CH"
        case .acceptClientHintLifetime:              return "Accept-CH-Lifetime"
        case .criticalClientHint:                    return "Critical-CH"
        case .secClientHintPrefersReducedMotion:     return "Sec-CH-Prefers-Reduced-Motion"
        case .secClientHintUserAgent:                return "Sec-CH-UA"
        case .secClientHintUserAgentArch:            return "Sec-CH-UA-Arch"
        case .secClientHintUserAgentBitness:         return "Sec-CH-UA-Bitness"
        case .secClientHintUserAgentFullVersion:     return "Sec-CH-UA-Full-Version"
        case .secClientHintUserAgentFullVersionList: return "Sec-CH-UA-Full-Version-List"
        case .secClientHintUserAgentMobile:          return "Sec-CH-UA-Mobile"
        case .secClientHintUserAgentModel:           return "Sec-CH-UA-Model"
        case .secClientHintUserAgentPlatform:        return "Sec-CH-UA-Platform"
        case .secClientHintUserAgentPlatformVersion: return "Sec-CH-UA-Platform-Version"
        case .contentDevicePixelRatio:               return "Content-DPR"
        case .deviceMemory:                          return "Device-Memory"
        case .devicePixelRatio:                      return "DPR"
        case .viewportWidth:                         return "Viewport-Width"
        case .width:                                 return "Width"
        case .downlink:                              return "Downlink"
        case .effectiveConnectionType:               return "ECT"
        case .roundTripTime:                         return "RTT"
        case .saveData:                              return "SaveData"
        // --------------------------------------------------------------------------------------
        
        // Conditionals -------------------------------------------------------------------------
        case .lastModified:                          return "Last-Modified"
        case .etag:                                  return "ETag"
        case .ifMatch:                               return "If-Match"
        case .ifNoneMatch:                           return "If-None-Match"
        case .ifModifiedSince:                       return "If-Modified-Since"
        case .ifUnmodifiedSince:                     return "If-Unmodified-Since"
        case .vary:                                  return "Vary"
        // --------------------------------------------------------------------------------------
        
        // Connection Management ----------------------------------------------------------------
        case .connection:                            return "Connection"
        case .keepAlive:                             return "Keep-Alive"
        // --------------------------------------------------------------------------------------
        
        // Content Negotiation ------------------------------------------------------------------
        case .accept:                                return "Accept"
        case .acceptEncoding:                        return "Accept-Encoding"
        case .acceptLanguage:                        return "Accept-Language"
        // --------------------------------------------------------------------------------------
        
        // Controls -----------------------------------------------------------------------------
        case .expect:                                return "Expect"
        case .maxForwards:                           return "Max-Forwards"
        // --------------------------------------------------------------------------------------
        
        // Cookies ------------------------------------------------------------------------------
        case .cookie:                                return "Cookie"
        case .setCookie:                             return "Set-Cookie"
        // --------------------------------------------------------------------------------------
        
        // CORS ---------------------------------------------------------------------------------
        case .accessControlAllowOrigin:              return "Access-Control-Allow-Origin"
        case .accessControlAllowCredentials:         return "Access-Control-Allow-Credentials"
        case .accessControlAllowHeaders:             return "Access-Control-Allow-Headers"
        case .accessControlAllowMethods:             return "Access-Control-Allow-Methods"
        case .accessControlExposeHeaders:            return "Access-Control-Expose-Headers"
        case .accessControlMaxAge:                   return "Access-Control-Max-Age"
        case .accessControlRequestHeaders:           return "Access-Control-Request-Headers"
        case .accessControlRequestMethod:            return "Access-Control-Request-Method"
        case .origin:                                return "Origin"
        case .timingAllowOrigin:                     return "Timing-Allow-Origin"
        // --------------------------------------------------------------------------------------
            
        // Downloads ----------------------------------------------------------------------------
        case .contentDisposition:                    return "Content-Disposition"
        // --------------------------------------------------------------------------------------
            
        // Message Body Information -------------------------------------------------------------
        case .contentLength:                         return "Content-Length"
        case .contentType:                           return "Content-Type"
        case .contentEncoding:                       return "Content-Encoding"
        case .contentLanguage:                       return "Content-Language"
        case .contentLocation:                       return "Content-Location"
        // --------------------------------------------------------------------------------------
            
        // Proxies ------------------------------------------------------------------------------
        case .forwarded:                             return "Forwarded"
        case .xForwardedFor:                         return "X-Forwarded-For"
        case .xForwardedHost:                        return "X-Forwarded-Host"
        case .xForwardedProto:                       return "X-Forwarded-Proto"
        case .via:                                   return "Via"
        // --------------------------------------------------------------------------------------
        
        // Redirects ----------------------------------------------------------------------------
        case .location:                              return "Location"
        case .refresh:                               return "Refresh"
        // --------------------------------------------------------------------------------------
        
        // Request Context ----------------------------------------------------------------------
        case .from:                                  return "From"
        case .host:                                  return "Host"
        case .referer:                               return "Referer"
        case .referrerPolicy:                        return "Referrer-Policy"
        case .userAgent:                             return "User-Agent"
        // --------------------------------------------------------------------------------------
            
        // Response Context ---------------------------------------------------------------------
        case .allow:                                 return "Allow"
        case .server:                                return "Server"
        // --------------------------------------------------------------------------------------
        
        // Range Requests -----------------------------------------------------------------------
        case .acceptRanges:                          return "Accept-Ranges"
        case .range:                                 return "Range"
        case .ifRange:                               return "If-Range"
        case .contentRange:                          return "Content-Range"
        // --------------------------------------------------------------------------------------
        
        // Security -----------------------------------------------------------------------------
        case .crossOriginEmbedderPolicy:             return "Cross-Origin-Embedder-Policy"
        case .crossOriginOpenerPolicy:               return "Cross-Origin-Opener-Policy"
        case .crossOriginResourcePolicy:             return "Cross-Origin-Resource-Policy"
        case .contentSecurityPolicy:                 return "Content-Security-Policy"
        case .contentSecurityPolicyReportOnly:       return "Content-Security-Policy-Report-Only"
        case .expectCertificateTransparency:         return "Expect-CT"
        case .originIsolation:                       return "Origin-Isolation"
        case .permissionsPolicy:                     return "Permissions-Policy"
        case .strictTransportSecurity:               return "Strict-Transport-Security"
        case .upgradeInsecureRequests:               return "Upgrade-Insecure-Requests"
        case .xContentTypeOptions:                   return "X-Content-Type-Options"
        case .xDownloadOptions:                      return "X-Download-Options"
        case .xFrameOptions:                         return "X-Frame-Options"
        case .xPermittedCrossDomainPolicies:         return "X-Permitted-Cross-Domain-Policies"
        case .xPoweredBy:                            return "X-Powered-By"
        case .xXSSProtection:                        return "X-XSS-Protection"
        case .secFetchSite:                          return "Sec-Fetch-Site"
        case .secFetchMode:                          return "Sec-Fetch-Mode"
        case .secFetchUser:                          return "Sec-Fetch-User"
        case .secFetchDest:                          return "Sec-Fetch-Dest"
        case .serviceWorkerNavigationPreload:        return "Service-Worker-Navigation-Preload"
        // --------------------------------------------------------------------------------------
        
        // Server-sent Events -------------------------------------------------------------------
        case .lastEventID:                           return "Last-Event-ID"
        case .nel:                                   return "NEL"
        case .pingFrom:                              return "Ping-From"
        case .pingTo:                                return "Ping-To"
        case .reportTo:                              return "Report-To"
        // --------------------------------------------------------------------------------------
        
        // Transfer Coding ----------------------------------------------------------------------
        case .transferEncoding:                      return "Transfer-Encoding"
        case .te:                                    return "TE"
        case .trailer:                               return "Trailer"
        // --------------------------------------------------------------------------------------
        
        // WebSockets ---------------------------------------------------------------------------
        case .secWebSocketKey:                       return "Sec-WebSocket-Key"
        case .secWebSocketExtensions:                return "Sec-WebSocket-Extensions"
        case .secWebSocketAccept:                    return "Sec-WebSocket-Accept"
        case .secWebSocketProtocol:                  return "Sec-WebSocket-Protocol"
        case .secWebSocketVersion:                   return "Sec-WebSocket-Version"
        // --------------------------------------------------------------------------------------
        
        // Other --------------------------------------------------------------------------------
        case .acceptPushPolicy:                      return "Accept-Push-Policy"
        case .acceptSignature:                       return "Accept-Signature"
        case .altSvc:                                return "Alt-Svc"
        case .date:                                  return "Date"
        case .earlyData:                             return "Early-Data"
        case .largeAllocation:                       return "Large-Allocation"
        case .link:                                  return "Link"
        case .pushPolicy:                            return "Push-Policy"
        case .retryAfter:                            return "Retry-After"
        case .signature:                             return "Signature"
        case .signedHeaders:                         return "Signed-Headers"
        case .serverTiming:                          return "Server-Timing"
        case .serviceWorkerAllowed:                  return "Service-Worker-Allowed"
        case .sourceMap:                             return "SourceMap"
        case .upgrade:                               return "Upgrade"
        case .xDNSPrefetchControl:                   return "X-DNS-Prefetch-Control"
        case .xFirefoxSpdy:                          return "X-Firefox-Spdy"
        case .xPingback:                             return "X-Pingback"
        case .xRequestedWith:                        return "X-Requested-With"
        case .xRobotsTag:                            return "X-Robots-Tag"
        case .xUACompatible:                         return "X-UA-Compatible"
        // --------------------------------------------------------------------------------------
        
        // Unknown ------------------------------------------------------------------------------
        case .unknown(let rawValue):                 return rawValue
        // --------------------------------------------------------------------------------------
        // swiftformat:enable all
        }
    }
}
