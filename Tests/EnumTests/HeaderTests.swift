//
//  HeaderTests.swift
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

// MARK: HeaderTests

final class HeaderTests: XCTestCase {
    // MARK: - test_rawValue

    func test_rawValue() {
        // swiftformat:disable all
        // Authentication ------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.authenticate.rawValue,                          "WWW-Authenticate")
        XCTAssertEqual(Header.authorization.rawValue,                         "Authorization")
        XCTAssertEqual(Header.proxyAuthenticate.rawValue,                     "Proxy-Authenticate")
        XCTAssertEqual(Header.proxyAuthorization.rawValue,                    "Proxy-Authorization")
        // ---------------------------------------------------------------------------------------------------------
            
        // Caching -------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.age.rawValue,                                   "Age")
        XCTAssertEqual(Header.cacheControl.rawValue,                          "Cache-Control")
        XCTAssertEqual(Header.clearSiteData.rawValue,                         "Clear-Site-Data")
        XCTAssertEqual(Header.expires.rawValue,                               "Expires")
        XCTAssertEqual(Header.pragma.rawValue,                                "Pragma")
        XCTAssertEqual(Header.warning.rawValue,                               "Warning")
        // ---------------------------------------------------------------------------------------------------------
        
        // Client Hints --------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.acceptClientHint.rawValue,                      "Accept-CH")
        XCTAssertEqual(Header.acceptClientHintLifetime.rawValue,              "Accept-CH-Lifetime")
        XCTAssertEqual(Header.criticalClientHint.rawValue,                    "Critical-CH")
        XCTAssertEqual(Header.secClientHintPrefersReducedMotion.rawValue,     "Sec-CH-Prefers-Reduced-Motion")
        XCTAssertEqual(Header.secClientHintUserAgent.rawValue,                "Sec-CH-UA")
        XCTAssertEqual(Header.secClientHintUserAgentArch.rawValue,            "Sec-CH-UA-Arch")
        XCTAssertEqual(Header.secClientHintUserAgentBitness.rawValue,         "Sec-CH-UA-Bitness")
        XCTAssertEqual(Header.secClientHintUserAgentFullVersion.rawValue,     "Sec-CH-UA-Full-Version")
        XCTAssertEqual(Header.secClientHintUserAgentFullVersionList.rawValue, "Sec-CH-UA-Full-Version-List")
        XCTAssertEqual(Header.secClientHintUserAgentMobile.rawValue,          "Sec-CH-UA-Mobile")
        XCTAssertEqual(Header.secClientHintUserAgentModel.rawValue,           "Sec-CH-UA-Model")
        XCTAssertEqual(Header.secClientHintUserAgentPlatform.rawValue,        "Sec-CH-UA-Platform")
        XCTAssertEqual(Header.secClientHintUserAgentPlatformVersion.rawValue, "Sec-CH-UA-Platform-Version")
        XCTAssertEqual(Header.contentDevicePixelRatio.rawValue,               "Content-DPR")
        XCTAssertEqual(Header.deviceMemory.rawValue,                          "Device-Memory")
        XCTAssertEqual(Header.devicePixelRatio.rawValue,                      "DPR")
        XCTAssertEqual(Header.viewportWidth.rawValue,                         "Viewport-Width")
        XCTAssertEqual(Header.width.rawValue,                                 "Width")
        XCTAssertEqual(Header.downlink.rawValue,                              "Downlink")
        XCTAssertEqual(Header.effectiveConnectionType.rawValue,               "ECT")
        XCTAssertEqual(Header.roundTripTime.rawValue,                         "RTT")
        XCTAssertEqual(Header.saveData.rawValue,                              "SaveData")
        // ---------------------------------------------------------------------------------------------------------
        
        // Conditionals --------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.lastModified.rawValue,                          "Last-Modified")
        XCTAssertEqual(Header.etag.rawValue,                                  "ETag")
        XCTAssertEqual(Header.ifMatch.rawValue,                               "If-Match")
        XCTAssertEqual(Header.ifNoneMatch.rawValue,                           "If-None-Match")
        XCTAssertEqual(Header.ifModifiedSince.rawValue,                       "If-Modified-Since")
        XCTAssertEqual(Header.ifUnmodifiedSince.rawValue,                     "If-Unmodified-Since")
        XCTAssertEqual(Header.vary.rawValue,                                  "Vary")
        // ---------------------------------------------------------------------------------------------------------
        
        // Connection Management -----------------------------------------------------------------------------------
        XCTAssertEqual(Header.connection.rawValue,                            "Connection")
        XCTAssertEqual(Header.keepAlive.rawValue,                             "Keep-Alive")
        // ---------------------------------------------------------------------------------------------------------
        
        // Content Negotiation -------------------------------------------------------------------------------------
        XCTAssertEqual(Header.accept.rawValue,                                "Accept")
        XCTAssertEqual(Header.acceptEncoding.rawValue,                        "Accept-Encoding")
        XCTAssertEqual(Header.acceptLanguage.rawValue,                        "Accept-Language")
        // ---------------------------------------------------------------------------------------------------------
        
        // Controls ------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.expect.rawValue,                                "Expect")
        XCTAssertEqual(Header.maxForwards.rawValue,                           "Max-Forwards")
        // ---------------------------------------------------------------------------------------------------------
        
        // Cookies -------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.cookie.rawValue,                                "Cookie")
        XCTAssertEqual(Header.setCookie.rawValue,                             "Set-Cookie")
        // ---------------------------------------------------------------------------------------------------------
        
        // CORS ----------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.accessControlAllowOrigin.rawValue,              "Access-Control-Allow-Origin")
        XCTAssertEqual(Header.accessControlAllowCredentials.rawValue,         "Access-Control-Allow-Credentials")
        XCTAssertEqual(Header.accessControlAllowHeaders.rawValue,             "Access-Control-Allow-Headers")
        XCTAssertEqual(Header.accessControlAllowMethods.rawValue,             "Access-Control-Allow-Methods")
        XCTAssertEqual(Header.accessControlExposeHeaders.rawValue,            "Access-Control-Expose-Headers")
        XCTAssertEqual(Header.accessControlMaxAge.rawValue,                   "Access-Control-Max-Age")
        XCTAssertEqual(Header.accessControlRequestHeaders.rawValue,           "Access-Control-Request-Headers")
        XCTAssertEqual(Header.accessControlRequestMethod.rawValue,            "Access-Control-Request-Method")
        XCTAssertEqual(Header.origin.rawValue,                                "Origin")
        XCTAssertEqual(Header.timingAllowOrigin.rawValue,                     "Timing-Allow-Origin")
        // ---------------------------------------------------------------------------------------------------------
            
        // Downloads -----------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.contentDisposition.rawValue,                    "Content-Disposition")
        // ---------------------------------------------------------------------------------------------------------
            
        // Message Body Information --------------------------------------------------------------------------------
        XCTAssertEqual(Header.contentLength.rawValue,                         "Content-Length")
        XCTAssertEqual(Header.contentType.rawValue,                           "Content-Type")
        XCTAssertEqual(Header.contentEncoding.rawValue,                       "Content-Encoding")
        XCTAssertEqual(Header.contentLanguage.rawValue,                       "Content-Language")
        XCTAssertEqual(Header.contentLocation.rawValue,                       "Content-Location")
        // ---------------------------------------------------------------------------------------------------------
            
        // Proxies -------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.forwarded.rawValue,                             "Forwarded")
        XCTAssertEqual(Header.xForwardedFor.rawValue,                         "X-Forwarded-For")
        XCTAssertEqual(Header.xForwardedHost.rawValue,                        "X-Forwarded-Host")
        XCTAssertEqual(Header.xForwardedProto.rawValue,                       "X-Forwarded-Proto")
        XCTAssertEqual(Header.via.rawValue,                                   "Via")
        // ---------------------------------------------------------------------------------------------------------
        
        // Redirects -----------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.location.rawValue,                              "Location")
        XCTAssertEqual(Header.refresh.rawValue,                               "Refresh")
        // ---------------------------------------------------------------------------------------------------------
        
        // Request Context -----------------------------------------------------------------------------------------
        XCTAssertEqual(Header.from.rawValue,                                  "From")
        XCTAssertEqual(Header.host.rawValue,                                  "Host")
        XCTAssertEqual(Header.referer.rawValue,                               "Referer")
        XCTAssertEqual(Header.referrerPolicy.rawValue,                        "Referrer-Policy")
        XCTAssertEqual(Header.userAgent.rawValue,                             "User-Agent")
        // ---------------------------------------------------------------------------------------------------------
            
        // Response Context ----------------------------------------------------------------------------------------
        XCTAssertEqual(Header.allow.rawValue,                                 "Allow")
        XCTAssertEqual(Header.server.rawValue,                                "Server")
        // ---------------------------------------------------------------------------------------------------------
        
        // Range Requests ------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.acceptRanges.rawValue,                          "Accept-Ranges")
        XCTAssertEqual(Header.range.rawValue,                                 "Range")
        XCTAssertEqual(Header.ifRange.rawValue,                               "If-Range")
        XCTAssertEqual(Header.contentRange.rawValue,                          "Content-Range")
        // ---------------------------------------------------------------------------------------------------------
        
        // Security ------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.crossOriginEmbedderPolicy.rawValue,             "Cross-Origin-Embedder-Policy")
        XCTAssertEqual(Header.crossOriginOpenerPolicy.rawValue,               "Cross-Origin-Opener-Policy")
        XCTAssertEqual(Header.crossOriginResourcePolicy.rawValue,             "Cross-Origin-Resource-Policy")
        XCTAssertEqual(Header.contentSecurityPolicy.rawValue,                 "Content-Security-Policy")
        XCTAssertEqual(Header.contentSecurityPolicyReportOnly.rawValue,       "Content-Security-Policy-Report-Only")
        XCTAssertEqual(Header.expectCertificateTransparency.rawValue,         "Expect-CT")
        XCTAssertEqual(Header.originIsolation.rawValue,                       "Origin-Isolation")
        XCTAssertEqual(Header.permissionsPolicy.rawValue,                     "Permissions-Policy")
        XCTAssertEqual(Header.strictTransportSecurity.rawValue,               "Strict-Transport-Security")
        XCTAssertEqual(Header.upgradeInsecureRequests.rawValue,               "Upgrade-Insecure-Requests")
        XCTAssertEqual(Header.xContentTypeOptions.rawValue,                   "X-Content-Type-Options")
        XCTAssertEqual(Header.xDownloadOptions.rawValue,                      "X-Download-Options")
        XCTAssertEqual(Header.xFrameOptions.rawValue,                         "X-Frame-Options")
        XCTAssertEqual(Header.xPermittedCrossDomainPolicies.rawValue,         "X-Permitted-Cross-Domain-Policies")
        XCTAssertEqual(Header.xPoweredBy.rawValue,                            "X-Powered-By")
        XCTAssertEqual(Header.xXSSProtection.rawValue,                        "X-XSS-Protection")
        XCTAssertEqual(Header.secFetchSite.rawValue,                          "Sec-Fetch-Site")
        XCTAssertEqual(Header.secFetchMode.rawValue,                          "Sec-Fetch-Mode")
        XCTAssertEqual(Header.secFetchUser.rawValue,                          "Sec-Fetch-User")
        XCTAssertEqual(Header.secFetchDest.rawValue,                          "Sec-Fetch-Dest")
        XCTAssertEqual(Header.serviceWorkerNavigationPreload.rawValue,        "Service-Worker-Navigation-Preload")
        // ---------------------------------------------------------------------------------------------------------
        
        // Server-sent Events --------------------------------------------------------------------------------------
        XCTAssertEqual(Header.lastEventID.rawValue,                           "Last-Event-ID")
        XCTAssertEqual(Header.nel.rawValue,                                   "NEL")
        XCTAssertEqual(Header.pingFrom.rawValue,                              "Ping-From")
        XCTAssertEqual(Header.pingTo.rawValue,                                "Ping-To")
        XCTAssertEqual(Header.reportTo.rawValue,                              "Report-To")
        // ---------------------------------------------------------------------------------------------------------
        
        // Transfer Coding -----------------------------------------------------------------------------------------
        XCTAssertEqual(Header.transferEncoding.rawValue,                      "Transfer-Encoding")
        XCTAssertEqual(Header.te.rawValue,                                    "TE")
        XCTAssertEqual(Header.trailer.rawValue,                               "Trailer")
        // ---------------------------------------------------------------------------------------------------------
        
        // WebSockets ----------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.secWebSocketKey.rawValue,                       "Sec-WebSocket-Key")
        XCTAssertEqual(Header.secWebSocketExtensions.rawValue,                "Sec-WebSocket-Extensions")
        XCTAssertEqual(Header.secWebSocketAccept.rawValue,                    "Sec-WebSocket-Accept")
        XCTAssertEqual(Header.secWebSocketProtocol.rawValue,                  "Sec-WebSocket-Protocol")
        XCTAssertEqual(Header.secWebSocketVersion.rawValue,                   "Sec-WebSocket-Version")
        // ---------------------------------------------------------------------------------------------------------
        
        // Other ---------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.acceptPushPolicy.rawValue,                      "Accept-Push-Policy")
        XCTAssertEqual(Header.acceptSignature.rawValue,                       "Accept-Signature")
        XCTAssertEqual(Header.altSvc.rawValue,                                "Alt-Svc")
        XCTAssertEqual(Header.date.rawValue,                                  "Date")
        XCTAssertEqual(Header.earlyData.rawValue,                             "Early-Data")
        XCTAssertEqual(Header.largeAllocation.rawValue,                       "Large-Allocation")
        XCTAssertEqual(Header.link.rawValue,                                  "Link")
        XCTAssertEqual(Header.pushPolicy.rawValue,                            "Push-Policy")
        XCTAssertEqual(Header.retryAfter.rawValue,                            "Retry-After")
        XCTAssertEqual(Header.signature.rawValue,                             "Signature")
        XCTAssertEqual(Header.signedHeaders.rawValue,                         "Signed-Headers")
        XCTAssertEqual(Header.serverTiming.rawValue,                          "Server-Timing")
        XCTAssertEqual(Header.serviceWorkerAllowed.rawValue,                  "Service-Worker-Allowed")
        XCTAssertEqual(Header.sourceMap.rawValue,                             "SourceMap")
        XCTAssertEqual(Header.upgrade.rawValue,                               "Upgrade")
        XCTAssertEqual(Header.xDNSPrefetchControl.rawValue,                   "X-DNS-Prefetch-Control")
        XCTAssertEqual(Header.xFirefoxSpdy.rawValue,                          "X-Firefox-Spdy")
        XCTAssertEqual(Header.xPingback.rawValue,                             "X-Pingback")
        XCTAssertEqual(Header.xRequestedWith.rawValue,                        "X-Requested-With")
        XCTAssertEqual(Header.xRobotsTag.rawValue,                            "X-Robots-Tag")
        XCTAssertEqual(Header.xUACompatible.rawValue,                         "X-UA-Compatible")
        // ---------------------------------------------------------------------------------------------------------
        
        // Unknown -------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header.unknown("Custom-Header").rawValue,              "Custom-Header")
        // ---------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValue

    func test_initWithRawValue() {
        // swiftformat:disable all
        // Authentication ---------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "WWW-Authenticate"),                    Header.authenticate)
        XCTAssertEqual(Header(rawValue: "Authorization"),                       Header.authorization)
        XCTAssertEqual(Header(rawValue: "Proxy-Authenticate"),                  Header.proxyAuthenticate)
        XCTAssertEqual(Header(rawValue: "Proxy-Authorization"),                 Header.proxyAuthorization)
        // ------------------------------------------------------------------------------------------------------------

        // Caching ----------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Age"),                                 Header.age)
        XCTAssertEqual(Header(rawValue: "Cache-Control"),                       Header.cacheControl)
        XCTAssertEqual(Header(rawValue: "Clear-Site-Data"),                     Header.clearSiteData)
        XCTAssertEqual(Header(rawValue: "Expires"),                             Header.expires)
        XCTAssertEqual(Header(rawValue: "Pragma"),                              Header.pragma)
        XCTAssertEqual(Header(rawValue: "Warning"),                             Header.warning)
        // ------------------------------------------------------------------------------------------------------------

        // Client Hints -----------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Accept-CH"),                           Header.acceptClientHint)
        XCTAssertEqual(Header(rawValue: "Accept-CH-Lifetime"),                  Header.acceptClientHintLifetime)
        XCTAssertEqual(Header(rawValue: "Critical-CH"),                         Header.criticalClientHint)
        XCTAssertEqual(Header(rawValue: "Sec-CH-Prefers-Reduced-Motion"),       Header.secClientHintPrefersReducedMotion)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA"),                           Header.secClientHintUserAgent)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Arch"),                      Header.secClientHintUserAgentArch)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Bitness"),                   Header.secClientHintUserAgentBitness)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Full-Version"),              Header.secClientHintUserAgentFullVersion)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Full-Version-List"),         Header.secClientHintUserAgentFullVersionList)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Mobile"),                    Header.secClientHintUserAgentMobile)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Model"),                     Header.secClientHintUserAgentModel)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Platform"),                  Header.secClientHintUserAgentPlatform)
        XCTAssertEqual(Header(rawValue: "Sec-CH-UA-Platform-Version"),          Header.secClientHintUserAgentPlatformVersion)
        XCTAssertEqual(Header(rawValue: "Content-DPR"),                         Header.contentDevicePixelRatio)
        XCTAssertEqual(Header(rawValue: "Device-Memory"),                       Header.deviceMemory)
        XCTAssertEqual(Header(rawValue: "DPR"),                                 Header.devicePixelRatio)
        XCTAssertEqual(Header(rawValue: "Viewport-Width"),                      Header.viewportWidth)
        XCTAssertEqual(Header(rawValue: "Width"),                               Header.width)
        XCTAssertEqual(Header(rawValue: "Downlink"),                            Header.downlink)
        XCTAssertEqual(Header(rawValue: "ECT"),                                 Header.effectiveConnectionType)
        XCTAssertEqual(Header(rawValue: "RTT"),                                 Header.roundTripTime)
        XCTAssertEqual(Header(rawValue: "SaveData"),                            Header.saveData)
        // ------------------------------------------------------------------------------------------------------------

        // Conditionals -----------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Last-Modified"),                       Header.lastModified)
        XCTAssertEqual(Header(rawValue: "ETag"),                                Header.etag)
        XCTAssertEqual(Header(rawValue: "If-Match"),                            Header.ifMatch)
        XCTAssertEqual(Header(rawValue: "If-None-Match"),                       Header.ifNoneMatch)
        XCTAssertEqual(Header(rawValue: "If-Modified-Since"),                   Header.ifModifiedSince)
        XCTAssertEqual(Header(rawValue: "If-Unmodified-Since"),                 Header.ifUnmodifiedSince)
        XCTAssertEqual(Header(rawValue: "Vary"),                                Header.vary)
        // ------------------------------------------------------------------------------------------------------------

        // Connection Management --------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Connection"),                          Header.connection)
        XCTAssertEqual(Header(rawValue: "Keep-Alive"),                          Header.keepAlive)
        // ------------------------------------------------------------------------------------------------------------

        // Content Negotiation ----------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Accept"),                              Header.accept)
        XCTAssertEqual(Header(rawValue: "Accept-Encoding"),                     Header.acceptEncoding)
        XCTAssertEqual(Header(rawValue: "Accept-Language"),                     Header.acceptLanguage)
        // ------------------------------------------------------------------------------------------------------------

        // Controls ---------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Expect"),                              Header.expect)
        XCTAssertEqual(Header(rawValue: "Max-Forwards"),                        Header.maxForwards)
        // ------------------------------------------------------------------------------------------------------------

        // Cookies ----------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Cookie"),                              Header.cookie)
        XCTAssertEqual(Header(rawValue: "Set-Cookie"),                          Header.setCookie)
        // ------------------------------------------------------------------------------------------------------------

        // CORS -------------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Access-Control-Allow-Origin"),         Header.accessControlAllowOrigin)
        XCTAssertEqual(Header(rawValue: "Access-Control-Allow-Credentials"),    Header.accessControlAllowCredentials)
        XCTAssertEqual(Header(rawValue: "Access-Control-Allow-Headers"),        Header.accessControlAllowHeaders)
        XCTAssertEqual(Header(rawValue: "Access-Control-Allow-Methods"),        Header.accessControlAllowMethods)
        XCTAssertEqual(Header(rawValue: "Access-Control-Expose-Headers"),       Header.accessControlExposeHeaders)
        XCTAssertEqual(Header(rawValue: "Access-Control-Max-Age"),              Header.accessControlMaxAge)
        XCTAssertEqual(Header(rawValue: "Access-Control-Request-Headers"),      Header.accessControlRequestHeaders)
        XCTAssertEqual(Header(rawValue: "Access-Control-Request-Method"),       Header.accessControlRequestMethod)
        XCTAssertEqual(Header(rawValue: "Origin"),                              Header.origin)
        XCTAssertEqual(Header(rawValue: "Timing-Allow-Origin"),                 Header.timingAllowOrigin)
        // ------------------------------------------------------------------------------------------------------------

        // Downloads --------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Content-Disposition"),                 Header.contentDisposition)
        // ------------------------------------------------------------------------------------------------------------

        // Message Body Information -----------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Content-Length"),                      Header.contentLength)
        XCTAssertEqual(Header(rawValue: "Content-Type"),                        Header.contentType)
        XCTAssertEqual(Header(rawValue: "Content-Encoding"),                    Header.contentEncoding)
        XCTAssertEqual(Header(rawValue: "Content-Language"),                    Header.contentLanguage)
        XCTAssertEqual(Header(rawValue: "Content-Location"),                    Header.contentLocation)
        // ------------------------------------------------------------------------------------------------------------

        // Proxies ----------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Forwarded"),                           Header.forwarded)
        XCTAssertEqual(Header(rawValue: "X-Forwarded-For"),                     Header.xForwardedFor)
        XCTAssertEqual(Header(rawValue: "X-Forwarded-Host"),                    Header.xForwardedHost)
        XCTAssertEqual(Header(rawValue: "X-Forwarded-Proto"),                   Header.xForwardedProto)
        XCTAssertEqual(Header(rawValue: "Via"),                                 Header.via)
        // ------------------------------------------------------------------------------------------------------------

        // Redirects --------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Location"),                            Header.location)
        XCTAssertEqual(Header(rawValue: "Refresh"),                             Header.refresh)
        // ------------------------------------------------------------------------------------------------------------

        // Request Context --------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "From"),                                Header.from)
        XCTAssertEqual(Header(rawValue: "Host"),                                Header.host)
        XCTAssertEqual(Header(rawValue: "Referer"),                             Header.referer)
        XCTAssertEqual(Header(rawValue: "Referrer-Policy"),                     Header.referrerPolicy)
        XCTAssertEqual(Header(rawValue: "User-Agent"),                          Header.userAgent)
        // ------------------------------------------------------------------------------------------------------------

        // Response Context -------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Allow"),                               Header.allow)
        XCTAssertEqual(Header(rawValue: "Server"),                              Header.server)
        // ------------------------------------------------------------------------------------------------------------

        // Range Requests ---------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Accept-Ranges"),                       Header.acceptRanges)
        XCTAssertEqual(Header(rawValue: "Range"),                               Header.range)
        XCTAssertEqual(Header(rawValue: "If-Range"),                            Header.ifRange)
        XCTAssertEqual(Header(rawValue: "Content-Range"),                       Header.contentRange)
        // ------------------------------------------------------------------------------------------------------------

        // Security ---------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Cross-Origin-Embedder-Policy"),        Header.crossOriginEmbedderPolicy)
        XCTAssertEqual(Header(rawValue: "Cross-Origin-Opener-Policy"),          Header.crossOriginOpenerPolicy)
        XCTAssertEqual(Header(rawValue: "Cross-Origin-Resource-Policy"),        Header.crossOriginResourcePolicy)
        XCTAssertEqual(Header(rawValue: "Content-Security-Policy"),             Header.contentSecurityPolicy)
        XCTAssertEqual(Header(rawValue: "Content-Security-Policy-Report-Only"), Header.contentSecurityPolicyReportOnly)
        XCTAssertEqual(Header(rawValue: "Expect-CT"),                           Header.expectCertificateTransparency)
        XCTAssertEqual(Header(rawValue: "Origin-Isolation"),                    Header.originIsolation)
        XCTAssertEqual(Header(rawValue: "Permissions-Policy"),                  Header.permissionsPolicy)
        XCTAssertEqual(Header(rawValue: "Strict-Transport-Security"),           Header.strictTransportSecurity)
        XCTAssertEqual(Header(rawValue: "Upgrade-Insecure-Requests"),           Header.upgradeInsecureRequests)
        XCTAssertEqual(Header(rawValue: "X-Content-Type-Options"),              Header.xContentTypeOptions)
        XCTAssertEqual(Header(rawValue: "X-Download-Options"),                  Header.xDownloadOptions)
        XCTAssertEqual(Header(rawValue: "X-Frame-Options"),                     Header.xFrameOptions)
        XCTAssertEqual(Header(rawValue: "X-Permitted-Cross-Domain-Policies"),   Header.xPermittedCrossDomainPolicies)
        XCTAssertEqual(Header(rawValue: "X-Powered-By"),                        Header.xPoweredBy)
        XCTAssertEqual(Header(rawValue: "X-XSS-Protection"),                    Header.xXSSProtection)
        XCTAssertEqual(Header(rawValue: "Sec-Fetch-Site"),                      Header.secFetchSite)
        XCTAssertEqual(Header(rawValue: "Sec-Fetch-Mode"),                      Header.secFetchMode)
        XCTAssertEqual(Header(rawValue: "Sec-Fetch-User"),                      Header.secFetchUser)
        XCTAssertEqual(Header(rawValue: "Sec-Fetch-Dest"),                      Header.secFetchDest)
        XCTAssertEqual(Header(rawValue: "Service-Worker-Navigation-Preload"),   Header.serviceWorkerNavigationPreload)
        // ------------------------------------------------------------------------------------------------------------

        // Server-sent Events -----------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Last-Event-ID"),                       Header.lastEventID)
        XCTAssertEqual(Header(rawValue: "NEL"),                                 Header.nel)
        XCTAssertEqual(Header(rawValue: "Ping-From"),                           Header.pingFrom)
        XCTAssertEqual(Header(rawValue: "Ping-To"),                             Header.pingTo)
        XCTAssertEqual(Header(rawValue: "Report-To"),                           Header.reportTo)
        // ------------------------------------------------------------------------------------------------------------

        // Transfer Coding --------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Transfer-Encoding"),                   Header.transferEncoding)
        XCTAssertEqual(Header(rawValue: "TE"),                                  Header.te)
        XCTAssertEqual(Header(rawValue: "Trailer"),                             Header.trailer)
        // ------------------------------------------------------------------------------------------------------------

        // WebSockets -------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Sec-WebSocket-Key"),                   Header.secWebSocketKey)
        XCTAssertEqual(Header(rawValue: "Sec-WebSocket-Extensions"),            Header.secWebSocketExtensions)
        XCTAssertEqual(Header(rawValue: "Sec-WebSocket-Accept"),                Header.secWebSocketAccept)
        XCTAssertEqual(Header(rawValue: "Sec-WebSocket-Protocol"),              Header.secWebSocketProtocol)
        XCTAssertEqual(Header(rawValue: "Sec-WebSocket-Version"),               Header.secWebSocketVersion)
        // ------------------------------------------------------------------------------------------------------------

        // Other ------------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Accept-Push-Policy"),                  Header.acceptPushPolicy)
        XCTAssertEqual(Header(rawValue: "Accept-Signature"),                    Header.acceptSignature)
        XCTAssertEqual(Header(rawValue: "Alt-Svc"),                             Header.altSvc)
        XCTAssertEqual(Header(rawValue: "Date"),                                Header.date)
        XCTAssertEqual(Header(rawValue: "Early-Data"),                          Header.earlyData)
        XCTAssertEqual(Header(rawValue: "Large-Allocation"),                    Header.largeAllocation)
        XCTAssertEqual(Header(rawValue: "Link"),                                Header.link)
        XCTAssertEqual(Header(rawValue: "Push-Policy"),                         Header.pushPolicy)
        XCTAssertEqual(Header(rawValue: "Retry-After"),                         Header.retryAfter)
        XCTAssertEqual(Header(rawValue: "Signature"),                           Header.signature)
        XCTAssertEqual(Header(rawValue: "Signed-Headers"),                      Header.signedHeaders)
        XCTAssertEqual(Header(rawValue: "Server-Timing"),                       Header.serverTiming)
        XCTAssertEqual(Header(rawValue: "Service-Worker-Allowed"),              Header.serviceWorkerAllowed)
        XCTAssertEqual(Header(rawValue: "SourceMap"),                           Header.sourceMap)
        XCTAssertEqual(Header(rawValue: "Upgrade"),                             Header.upgrade)
        XCTAssertEqual(Header(rawValue: "X-DNS-Prefetch-Control"),              Header.xDNSPrefetchControl)
        XCTAssertEqual(Header(rawValue: "X-Firefox-Spdy"),                      Header.xFirefoxSpdy)
        XCTAssertEqual(Header(rawValue: "X-Pingback"),                          Header.xPingback)
        XCTAssertEqual(Header(rawValue: "X-Requested-With"),                    Header.xRequestedWith)
        XCTAssertEqual(Header(rawValue: "X-Robots-Tag"),                        Header.xRobotsTag)
        XCTAssertEqual(Header(rawValue: "X-UA-Compatible"),                     Header.xUACompatible)
        // ------------------------------------------------------------------------------------------------------------
            
        // Unknown ----------------------------------------------------------------------------------------------------
        XCTAssertEqual(Header(rawValue: "Custom-Header"),                       Header.unknown("Custom-Header"))
        // ------------------------------------------------------------------------------------------------------------
        // swiftformat:enable all
    }

    // MARK: - test_initWithRawValueWithWhitespaces

    func test_initWithRawValueWithWhitespaces() {
        XCTAssertEqual(Header(rawValue: "WWW-Authenticate "), Header.authenticate, "String with trailing spaces should be handled.")
        XCTAssertEqual(Header(rawValue: " WWW-Authenticate"), Header.authenticate, "String with leading spaces should be handled.")
    }

    // MARK: - test_initWithRawValueWithEmptyString

    func test_initWithRawValueWithEmptyString() {
        XCTAssertNil(Header(rawValue: ""), "Empty string should return nil.")
        XCTAssertNil(Header(rawValue: " "), "String with only spaces should return nil.")
    }

    // MARK: - test_equatable

    func test_equatable() {
        // swiftformat:disable all
        let authenticateHeader        = Header.authenticate
        let authenticateHeaderFromRaw = Header(rawValue: "WWW-Authenticate")
        // swiftformat:enable all
        XCTAssertEqual(authenticateHeader, authenticateHeaderFromRaw, "Expected to be equal as they both represent the key 'WWW-Authenticate' in the HTTP header.")

        // swiftformat:disable all
        let unknownHeader        = Header.unknown("Custom-Header")
        let unknownHeaderFromRaw = Header(rawValue: "Custom-Header")
        // swiftformat:enable all
        XCTAssertEqual(unknownHeader, unknownHeaderFromRaw, "Expected to be equal as they both represent the key 'Custom-Header' in the HTTP header.")
    }
}
