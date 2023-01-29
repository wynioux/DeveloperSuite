//
//  Header+CaseIterable.swift
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

// MARK: CaseIterable

extension Header: CaseIterable {
    static var allCases: [Header] {
        return [
            // Authentication --------------
            .authenticate,
            .authorization,
            .proxyAuthenticate,
            .proxyAuthorization,
            // -----------------------------

            // Caching ---------------------
            .age,
            .cacheControl,
            .clearSiteData,
            .expires,
            .pragma,
            .warning,
            // -----------------------------

            // Client Hints ----------------
            .acceptClientHint,
            .acceptClientHintLifetime,
            .criticalClientHint,
            .secClientHintPrefersReducedMotion,
            .secClientHintUserAgent,
            .secClientHintUserAgentArch,
            .secClientHintUserAgentBitness,
            .secClientHintUserAgentFullVersion,
            .secClientHintUserAgentFullVersionList,
            .secClientHintUserAgentMobile,
            .secClientHintUserAgentModel,
            .secClientHintUserAgentPlatform,
            .secClientHintUserAgentPlatformVersion,
            .contentDevicePixelRatio,
            .deviceMemory,
            .devicePixelRatio,
            .viewportWidth,
            .width,
            .downlink,
            .effectiveConnectionType,
            .roundTripTime,
            .saveData,
            // -----------------------------

            // Conditionals ----------------
            .lastModified,
            .etag,
            .ifMatch,
            .ifNoneMatch,
            .ifModifiedSince,
            .ifUnmodifiedSince,
            .vary,
            // -----------------------------

            // Connection Management -------
            .connection,
            .keepAlive,
            // -----------------------------

            // Content Negotiation ---------
            .accept,
            .acceptEncoding,
            .acceptLanguage,
            // -----------------------------

            // Controls --------------------
            .expect,
            .maxForwards,
            // -----------------------------

            // Cookies ---------------------
            .cookie,
            .setCookie,
            // -----------------------------

            // CORS ------------------------
            .accessControlAllowOrigin,
            .accessControlAllowCredentials,
            .accessControlAllowHeaders,
            .accessControlAllowMethods,
            .accessControlExposeHeaders,
            .accessControlMaxAge,
            .accessControlRequestHeaders,
            .accessControlRequestMethod,
            .origin,
            .timingAllowOrigin,
            // -----------------------------

            // Downloads -------------------
            .contentDisposition,
            // -----------------------------

            // Message Body Information ----
            .contentLength,
            .contentType,
            .contentEncoding,
            .contentLanguage,
            .contentLocation,
            // -----------------------------

            // Proxies ---------------------
            .forwarded,
            .xForwardedFor,
            .xForwardedHost,
            .xForwardedProto,
            .via,
            // -----------------------------

            // Redirects -------------------
            .location,
            .refresh,
            // -----------------------------

            // Request Context -------------
            .from,
            .host,
            .referer,
            .referrerPolicy,
            .userAgent,
            // -----------------------------

            // Response Context ------------
            .allow,
            .server,
            // -----------------------------

            // Range Requests --------------
            .acceptRanges,
            .range,
            .ifRange,
            .contentRange,
            // -----------------------------

            // Security --------------------
            .crossOriginEmbedderPolicy,
            .crossOriginOpenerPolicy,
            .crossOriginResourcePolicy,
            .contentSecurityPolicy,
            .contentSecurityPolicyReportOnly,
            .expectCertificateTransparency,
            .originIsolation,
            .permissionsPolicy,
            .strictTransportSecurity,
            .upgradeInsecureRequests,
            .xContentTypeOptions,
            .xDownloadOptions,
            .xFrameOptions,
            .xPermittedCrossDomainPolicies,
            .xPoweredBy,
            .xXSSProtection,
            .secFetchSite,
            .secFetchMode,
            .secFetchUser,
            .secFetchDest,
            .serviceWorkerNavigationPreload,
            // -----------------------------

            // Server-sent Events ----------
            .lastEventID,
            .nel,
            .pingFrom,
            .pingTo,
            .reportTo,
            // -----------------------------

            // Transfer Coding -------------
            .transferEncoding,
            .te,
            .trailer,
            // -----------------------------

            // WebSockets ------------------
            .secWebSocketKey,
            .secWebSocketExtensions,
            .secWebSocketAccept,
            .secWebSocketProtocol,
            .secWebSocketVersion,
            // -----------------------------

            // Other -----------------------
            .acceptPushPolicy,
            .acceptSignature,
            .altSvc,
            .date,
            .earlyData,
            .largeAllocation,
            .link,
            .pushPolicy,
            .retryAfter,
            .signature,
            .signedHeaders,
            .serverTiming,
            .serviceWorkerAllowed,
            .sourceMap,
            .upgrade,
            .xDNSPrefetchControl,
            .xFirefoxSpdy,
            .xPingback,
            .xRequestedWith,
            .xRobotsTag,
            .xUACompatible
            // -----------------------------
        ]
    }
}
