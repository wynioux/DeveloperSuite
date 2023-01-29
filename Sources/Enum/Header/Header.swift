//
//  Header.swift
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

// MARK: Header

/**
 HTTP headers let the client and the server pass additional information with an HTTP request or response. An HTTP header consists of its case-insensitive name followed by a colon (:), then by its value. [Whitespace](https://developer.mozilla.org/en-US/docs/Glossary/Whitespace) before the value is ignored.
     
 Custom proprietary headers have historically been used with an `X-` prefix, but this convention was deprecated in June 2012 because of the inconveniences it caused when nonstandard fields became standard in [RFC 6648](https://datatracker.ietf.org/doc/html/rfc6648); others are listed in an [IANA registry](https://www.iana.org/assignments/message-headers/message-headers.xhtml#perm-headers), whose original content was defined in [RFC 4229](https://datatracker.ietf.org/doc/html/rfc4229).
     
 Headers can be grouped according to their contexts:
     
 - [Request headers](https://developer.mozilla.org/en-US/docs/Glossary/Request_header) contain more information about the resource to be fetched, or about the client requesting the resource.
 - [Response headers](https://developer.mozilla.org/en-US/docs/Glossary/Response_header) hold additional information about the response, like its location or about the server providing it.
 - [Representation headers](https://developer.mozilla.org/en-US/docs/Glossary/Representation_header) contain information about the body of the resource, like its MIME type, or encoding/compression applied.
 - [Payload headers](https://developer.mozilla.org/en-US/docs/Glossary/Payload_header) contain representation-independent information about payload data, including content length and the encoding used for transport.
     
 - Note: IANA also maintains a [registry of proposed new HTTP headers](https://www.iana.org/assignments/message-headers/message-headers.xhtml#prov-headers).
 */
enum Header {
    // MARK: - Authentication
        
    /**
     WWW-Authenticate
         
     Defines the authentication method that should be used to access a resource.
     */
    case authenticate
        
    /**
     Authorization
         
     Contains the credentials to authenticate a user-agent with a server.
     */
    case authorization
        
    /**
     Proxy-Authenticate
         
     Defines the authentication method that should be used to access a resource behind a proxy server.
     */
    case proxyAuthenticate
        
    /**
     Proxy-Authorization
         
     Contains the credentials to authenticate a user agent with a proxy server.
     */
    case proxyAuthorization
        
    // MARK: - Caching
        
    /**
     Age
         
     The time, in seconds, that the object has been in a proxy cache.
     */
    case age
        
    /**
     Cache-Control
         
     Directives for caching mechanisms in both requests and responses.
     */
    case cacheControl
        
    /**
     Clear-Site-Data
         
     Clears browsing data (e.g. cookies, storage, cache) associated with the requesting website.
     */
    case clearSiteData
        
    /**
     Expires
         
     The date/time after which the response is considered stale.
     */
    case expires
        
    /**
     Pragma
         
     Implementation-specific header that may have various effects anywhere along the request-response chain. Used for backwards compatibility with HTTP/1.0 caches where the `Cache-Control` header is not yet present.
     */
    case pragma
        
    /**
     Warning
         
     General warning information about possible problems.
         
     - Warning: Deprecated
     */
    case warning
        
    // MARK: - Client Hints
        
    /**
     Accept-CH
         
     Servers can advertise support for Client Hints using the `Accept-CH` header field or an equivalent HTML `<meta>` element with [http-equiv](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta#attr-http-equiv) attribute.
         
     - Warning: Experimental
     */
    case acceptClientHint
        
    /**
     Accept-CH-Lifetime
         
     Servers can ask the client to remember the set of Client Hints that the server supports for a specified period of time, to enable delivery of Client Hints on subsequent requests to the server's origin.
         
     - Warning: Deprecated, Experimental
     */
    case acceptClientHintLifetime
        
    /**
     Critical-CH
         
     Servers use `Critical-CH` along with `Accept-CH` to specify that accepted client hints are also [critical client hints.](https://developer.mozilla.org/en-US/docs/Web/HTTP/Client_hints#critical_client_hints)
         
     - Warning: Experimental
     */
    case criticalClientHint
        
    /**
     Sec-CH-Prefers-Reduced-Motion
         
     User agent's reduced motion preference setting.
         
     - Warning: Experimental
     */
    case secClientHintPrefersReducedMotion
        
    /**
     Sec-CH-UA
         
     User agent's branding and version.
         
     - Warning: Experimental
     */
    case secClientHintUserAgent
        
    /**
     Sec-CH-UA-Arch
         
     User agent's underlying platform architecture.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentArch
        
    /**
     Sec-CH-UA-Bitness
         
     User agent's underlying CPU architecture bitness (for example "64" bit).
         
     - Warning: Experimental
     */
    case secClientHintUserAgentBitness
        
    /**
     Sec-CH-UA-Full-Version
         
     User agent's full semantic version string.
         
     - Warning: Deprecated
     */
    case secClientHintUserAgentFullVersion
        
    /**
     Sec-CH-UA-Full-Version-List
         
     Full version for each brand in the user agent's brand list.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentFullVersionList
        
    /**
     Sec-CH-UA-Mobile
         
     User agent is running on a mobile device or, more generally, prefers a "mobile" user experience.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentMobile
        
    /**
     Sec-CH-UA-Model
         
     User agent's device model.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentModel
        
    /**
     Sec-CH-UA-Platform
         
     User agent's underlying operation system/platform.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentPlatform
        
    /**
     Sec-CH-UA-Platform-Version
         
     User agent's underlying operation system version.
         
     - Warning: Experimental
     */
    case secClientHintUserAgentPlatformVersion
        
    /**
     Content-DPR
         
     Response header used to confirm the image device to pixel ratio in requests where the DPR client hint was used to select an image resource.
         
     - Warning: Deprecated, Experimental
     */
    case contentDevicePixelRatio
        
    /**
     Device-Memory
         
     Approximate amount of available client RAM memory. This is part of the Device Memory API.
         
     - Warning: Deprecated, Experimental
     */
    case deviceMemory
        
    /**
     DPR
         
     Client device pixel ratio (DPR), which is the number of physical device pixels corresponding to every CSS pixel.
         
     - Warning: Deprecated, Experimental
     */
    case devicePixelRatio
        
    /**
     Viewport-Width
         
     A number that indicates the layout viewport width in CSS pixels. The provided pixel value is a number rounded to the smallest following integer (i.e. ceiling value).
         
     - Warning: Deprecated, Experimental
     */
    case viewportWidth
        
    /**
     Width
         
     A number that indicates the desired resource width in physical pixels (i.e. intrinsic size of an image).
         
     - Warning: Deprecated, Experimental
     */
    case width
        
    /**
     Downlink
         
     Approximate bandwidth of the client's connection to the server, in Mbps. This is part of the [Network Information API.](https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API)
     */
    case downlink
        
    /**
     ECT
         
     The [effective connection type](https://developer.mozilla.org/en-US/docs/Glossary/Effective_connection_type) ("network profile") that best matches the connection's latency and bandwidth. This is part of the [Network Information API.](https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API)
     */
    case effectiveConnectionType
        
    /**
     RTT
         
     Application layer round trip time (RTT) in milliseconds, which includes the server processing time. This is part of the [Network Information API.](https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API)
     */
    case roundTripTime
        
    /**
     Save-Data
         
     A boolean that indicates the user agent's preference for reduced data usage.
         
     - Warning: Experimental
     */
    case saveData
        
    // MARK: - Conditionals
        
    /**
     Last-Modified
         
     The last modification date of the resource, used to compare several versions of the same resource. It is less accurate than `ETag`, but easier to calculate in some environments. Conditional requests using `If-Modified-Since` and `If-Unmodified-Since` use this value to change the behavior of the request.
     */
    case lastModified
        
    /**
     ETag
         
     A unique string identifying the version of the resource. Conditional requests using `If-Match` and `If-None-Match` use this value to change the behavior of the request.
     */
    case etag
        
    /**
     If-Match
         
     Makes the request conditional, and applies the method only if the stored resource matches one of the given ETags.
     */
    case ifMatch
        
    /**
     If-None-Match
         
     Makes the request conditional, and applies the method only if the stored resource doesn't match any of the given ETags. This is used to update caches (for safe requests), or to prevent uploading a new resource when one already exists.
     */
    case ifNoneMatch
        
    /**
     If-Modified-Since
         
     Makes the request conditional, and expects the resource to be transmitted only if it has been modified after the given date. This is used to transmit data only when the cache is out of date.
     */
    case ifModifiedSince
        
    /**
     If-Unmodified-Since
         
     Makes the request conditional, and expects the resource to be transmitted only if it has not been modified after the given date. This ensures the coherence of a new fragment of a specific range with previous ones, or to implement an optimistic concurrency control system when modifying existing documents.
     */
    case ifUnmodifiedSince
        
    /**
     Vary
         
     Determines how to match request headers to decide whether a cached response can be used rather than requesting a fresh one from the origin server.
     */
    case vary
        
    // MARK: - Connection Management
        
    /**
     Connection
         
     Controls whether the network connection stays open after the current transaction finishes.
     */
    case connection
        
    /**
     Keep-Alive
         
     Controls how long a persistent connection should stay open.
     */
    case keepAlive
        
    // MARK: - Content Negotiation
        
    /**
     Accept
         
     Informs the server about the [types](https://developer.mozilla.org/en-US/docs/Glossary/MIME_type) of data that can be sent back.
     */
    case accept
        
    /**
     Accept-Encoding
         
     The encoding algorithm, usually a [compression algorithm](https://developer.mozilla.org/en-US/docs/Web/HTTP/Compression), that can be used on the resource sent back.
     */
    case acceptEncoding
        
    /**
     Accept-Language
         
     Informs the server about the human language the server is expected to send back. This is a hint and is not necessarily under the full control of the user: the server should always pay attention not to override an explicit user choice (like selecting a language from a dropdown).
     */
    case acceptLanguage
        
    // MARK: - Controls
        
    /**
     Expect
         
     Indicates expectations that need to be fulfilled by the server to properly handle the request.
     */
    case expect
        
    /**
     Max-Forwards
         
     When using `TRACE`, indicates the maximum number of hops the request can do before being reflected to the sender.
     */
    case maxForwards
        
    // MARK: - Cookies
        
    /**
     Cookie
         
     Contains stored [HTTP cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) previously sent by the server with the `Set-Cookie` header.
     */
    case cookie
        
    /**
     Set-Cookie
         
     Send cookies from the server to the user-agent.
     */
    case setCookie
        
    // MARK: - CORS
        
    /**
     Access-Control-Allow-Origin
         
     Indicates whether the response can be shared.
     */
    case accessControlAllowOrigin
        
    /**
     Access-Control-Allow-Credentials
         
     Indicates whether the response to the request can be exposed when the credentials flag is true.
     */
    case accessControlAllowCredentials
        
    /**
     Access-Control-Allow-Headers
         
     Used in response to a [preflight request](https://developer.mozilla.org/en-US/docs/Glossary/Preflight_request) to indicate which HTTP headers can be used when making the actual request.
     */
    case accessControlAllowHeaders
        
    /**
     Access-Control-Allow-Methods
         
     Specifies the methods allowed when accessing the resource in response to a [preflight request.](https://developer.mozilla.org/en-US/docs/Glossary/Preflight_request)
     */
    case accessControlAllowMethods
        
    /**
     Access-Control-Expose-Headers
         
     Indicates which headers can be exposed as part of the response by listing their names.
     */
    case accessControlExposeHeaders
        
    /**
     Access-Control-Max-Age
         
     Indicates how long the results of a preflight request can be cached.
     */
    case accessControlMaxAge
        
    /**
     Access-Control-Request-Headers
         
     Used when issuing a preflight request to let the server know which HTTP headers will be used when the actual request is made.
     */
    case accessControlRequestHeaders
        
    /**
     Access-Control-Request-Method
         
     Used when issuing a preflight request to let the server know which HTTP method will be used when the actual request is made.
     */
    case accessControlRequestMethod
        
    /**
     Origin
         
     Indicates where a fetch originates from.
     */
    case origin
        
    /**
     Timing-Allow-Origin
         
     Specifies origins that are allowed to see values of attributes retrieved via features of the [Resource Timing API](https://developer.mozilla.org/en-US/docs/Web/API/Resource_Timing_API), which would otherwise be reported as zero due to cross-origin restrictions.
     */
    case timingAllowOrigin
        
    // MARK: - Downloads
        
    /**
     Content-Disposition
         
     Indicates if the resource transmitted should be displayed inline (default behavior without the header), or if it should be handled like a download and the browser should present a "Save As" dialog.
     */
    case contentDisposition
        
    // MARK: - Message Body Information
        
    /**
     Content-Length
         
     The size of the resource, in decimal number of bytes.
     */
    case contentLength
        
    /**
     Content-Type
         
     Indicates the media type of the resource.
     */
    case contentType
        
    /**
     Content-Encoding
         
     Used to specify the compression algorithm.
     */
    case contentEncoding
        
    /**
     Content-Language
         
     Describes the human language(s) intended for the audience, so that it allows a user to differentiate according to the users' own preferred language.
     */
    case contentLanguage
        
    /**
     Content-Location
         
     Indicates an alternate location for the returned data.
     */
    case contentLocation
        
    // MARK: - Proxies
        
    /**
     Forwarded
         
     Contains information from the client-facing side of proxy servers that is altered or lost when a proxy is involved in the path of the request.
     */
    case forwarded
        
    /**
     X-Forwarded-For
         
     Identifies the originating IP addresses of a client connecting to a web server through an HTTP proxy or a load balancer.
         
     - Warning: Non-standard
     */
    case xForwardedFor
        
    /**
     X-Forwarded-Host
         
     Identifies the original host requested that a client used to connect to your proxy or load balancer.
         
     - Warning: Non-standard
     */
    case xForwardedHost
        
    /**
     X-Forwarded-Proto
         
     Identifies the protocol (HTTP or HTTPS) that a client used to connect to your proxy or load balancer.
         
     - Warning: Non-standard
     */
    case xForwardedProto
        
    /**
     Via
         
     Added by proxies, both forward and reverse proxies, and can appear in the request headers and the response headers.
     */
    case via
        
    // MARK: - Redirects
        
    /**
     Location
         
     Indicates the URL to redirect a page to.
     */
    case location
        
    /**
     Refresh
         
     Directs the browser to reload the page or redirect to another. Takes the same value as the meta element with `http-equiv="refresh"`.
     */
    case refresh
        
    // MARK: - Request Context
        
    /**
     From
         
     Contains an Internet email address for a human user who controls the requesting user agent.
     */
    case from
        
    /**
     Host
         
     Specifies the domain name of the server (for virtual hosting), and (optionally) the TCP port number on which the server is listening.
     */
    case host
        
    /**
     Referer
         
     The address of the previous web page from which a link to the currently requested page was followed.
     */
    case referer
        
    /**
     Referrer-Policy
         
     Governs which referrer information sent in the `Referer` header should be included with requests made.
     */
    case referrerPolicy
        
    /**
     User-Agent
         
     Contains a characteristic string that allows the network protocol peers to identify the application type, operating system, software vendor or software version of the requesting software user agent. See also the [Firefox user agent string reference.](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent/Firefox)
     */
    case userAgent
        
    // MARK: - Response Context
        
    /**
     Allow
         
     Lists the set of HTTP request methods supported by a resource.
     */
    case allow
        
    /**
     Server
         
     Contains information about the software used by the origin server to handle the request.
     */
    case server
        
    // MARK: - Range Requests
        
    /**
     Accept-Ranges
         
     Indicates if the server supports range requests, and if so in which unit the range can be expressed.
     */
    case acceptRanges
        
    /**
     Range
         
     Indicates the part of a document that the server should return.
     */
    case range
        
    /**
     If-Range
         
     Creates a conditional range request that is only fulfilled if the given etag or date matches the remote resource. Used to prevent downloading two ranges from incompatible version of the resource.
     */
    case ifRange
        
    /**
     Content-Range
         
     Indicates where in a full body message a partial message belongs.
     */
    case contentRange
        
    // MARK: - Security
        
    /**
     Cross-Origin-Embedder-Policy (COEP)
         
     Allows a server to declare an embedder policy for a given document.
     */
    case crossOriginEmbedderPolicy
        
    /**
     Cross-Origin-Opener-Policy (COOP)
         
     Prevents other domains from opening/controlling a window.
     */
    case crossOriginOpenerPolicy
        
    /**
     Cross-Origin-Resource-Policy (CORP)
         
     Prevents other domains from reading the response of the resources to which this header is applied.
     */
    case crossOriginResourcePolicy
        
    /**
     Content-Security-Policy (CSP)
         
     Controls resources the user agent is allowed to load for a given page.
     */
    case contentSecurityPolicy
        
    /**
     Content-Security-Policy-Report-Only
         
     Allows web developers to experiment with policies by monitoring, but not enforcing, their effects. These violation reports consist of JSON documents sent via an HTTP POST request to the specified URI.
     */
    case contentSecurityPolicyReportOnly
        
    /**
     Expect-CT
         
     Allows sites to opt in to reporting and/or enforcement of Certificate Transparency requirements, which prevents the use of misissued certificates for that site from going unnoticed. When a site enables the Expect-CT header, they are requesting that Chrome check that any certificate for that site appears in public CT logs.
     */
    case expectCertificateTransparency
        
    /**
     Origin-Isolation
         
     Provides a mechanism to allow web applications to isolate their origins.
         
     - Warning: Experimental
     */
    case originIsolation
        
    /**
     Permissions-Policy
         
     Provides a mechanism to allow and deny the use of browser features in a web site's own frame, and in `<iframe>`s that it embeds.
     */
    case permissionsPolicy
        
    /**
     Strict-Transport-Security (HSTS)
         
     Force communication using HTTPS instead of HTTP.
     */
    case strictTransportSecurity
        
    /**
     Upgrade-Insecure-Requests
         
     Sends a signal to the server expressing the client's preference for an encrypted and authenticated response, and that it can successfully handle the upgrade-insecure-requests directive.
     */
    case upgradeInsecureRequests
        
    /**
     X-Content-Type-Options
         
     Disables MIME sniffing and forces browser to use the type given in `Content-Type`.
     */
    case xContentTypeOptions
        
    /**
     X-Download-Options
         
     The X-Download-Options HTTP header indicates that the browser (Internet Explorer) should not display the option to "Open" a file that has been downloaded from an application, to prevent phishing attacks as the file otherwise would gain access to execute in the context of the application.
     */
    case xDownloadOptions
        
    /**
     X-Frame-Options (XFO)
         
     Indicates whether a browser should be allowed to render a page in a `<frame>`, `<iframe>`, `<embed>` or `<object>`.
     */
    case xFrameOptions
        
    /**
     X-Permitted-Cross-Domain-Policies
         
     Specifies if a cross-domain policy file (`crossdomain.xml`) is allowed. The file may define a policy to grant clients, such as Adobe's Flash Player (now obsolete), Adobe Acrobat, Microsoft Silverlight (now obsolete), or Apache Flex, permission to handle data across domains that would otherwise be restricted due to the [Same-Origin Policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy). See the [Cross-domain Policy File Specification](https://www.adobe.com/devnet-docs/acrobatetk/tools/AppSec/CrossDomain_PolicyFile_Specification.pdf) for more information.
     */
    case xPermittedCrossDomainPolicies
        
    /**
     X-Powered-By
         
     May be set by hosting environments or other frameworks and contains information about them while not providing any usefulness to the application or its visitors. Unset this header to avoid exposing potential vulnerabilities.
     */
    case xPoweredBy
        
    /**
     X-XSS-Protection
         
     Enables cross-site scripting filtering.
     */
    case xXSSProtection
        
    /**
     Sec-Fetch-Site
         
     It is a request header that indicates the relationship between a request initiator's origin and its target's origin. It is a Structured Header whose value is a token with possible values `cross-site`, `same-origin`, `same-site`, and `none.
     */
    case secFetchSite
        
    /**
     Sec-Fetch-Mode
         
     It is a request header that indicates the request's mode to a server. It is a Structured Header whose value is a token with possible values `cors`, `navigate`, `no-cors`, `same-origin`, and `websocket`.
     */
    case secFetchMode
        
    /**
     Sec-Fetch-User
         
     It is a request header that indicates whether or not a navigation request was triggered by user activation. It is a Structured Header whose value is a boolean so possible values are `?0` for false and `?1` for true.
     */
    case secFetchUser
        
    /**
     Sec-Fetch-Dest
         
     It is a request header that indicates the request's destination to a server. It is a Structured Header whose value is a token with possible values `audio`, `audioworklet`, `document`, `embed`, `empty`, `font`, `image`, `manifest`, `object`, `paintworklet`, `report`, `script`, `serviceworker`, `sharedworker`, `style`, `track`, `video`, `worker`, and `xslt`.
     */
    case secFetchDest
        
    /**
     Service-Worker-Navigation-Preload
         
     A request header sent in preemptive request to `fetch()` a resource during service worker boot. The value, which is set with `NavigationPreloadManager.setHeaderValue()`, can be used to inform a server that a different resource should be returned than in a normal `fetch()` operation.
     */
    case serviceWorkerNavigationPreload
        
    // MARK: - Server-sent Events
        
    /**
     Last-Event-ID
     */
    case lastEventID
        
    /**
     NEL
         
     Defines a mechanism that enables developers to declare a network error reporting policy.
         
     - Warning: Experimental
     */
    case nel
        
    /**
     Ping-From
     */
    case pingFrom
        
    /**
     Ping-To
     */
    case pingTo
        
    /**
     Report-To
         
     Used to specify a server endpoint for the browser to send warning and error reports to.
     */
    case reportTo
        
    // MARK: - Transfer Coding
        
    /**
     Transfer-Encoding
         
     Specifies the form of encoding used to safely transfer the resource to the user.
     */
    case transferEncoding
        
    /**
     TE
         
     Specifies the transfer encodings the user agent is willing to accept.
     */
    case te
        
    /**
     Trailer
         
     Allows the sender to include additional fields at the end of chunked message.
     */
    case trailer
        
    // MARK: - WebSockets
        
    /**
     Sec-WebSocket-Key
     */
    case secWebSocketKey
        
    /**
     Sec-WebSocket-Extensions
     */
    case secWebSocketExtensions
        
    /**
     Sec-WebSocket-Accept
     */
    case secWebSocketAccept
        
    /**
     Sec-WebSocket-Protocol
     */
    case secWebSocketProtocol
        
    /**
     Sec-WebSocket-Version
     */
    case secWebSocketVersion
        
    // MARK: - Other
        
    /**
     Accept-Push-Policy
         
     A client can express the desired push policy for a request by sending an `Accept-Push-Policy header field in the request.
         
     - Warning: Experimental
     */
    case acceptPushPolicy
        
    /**
     Accept-Signature
         
     A client can send the `Accept-Signature` header field to indicate intention to take advantage of any available signatures and to indicate what kinds of signatures it supports.
         
     - Warning: Experimental
     */
    case acceptSignature
        
    /**
     Alt-Svc
         
     Used to list alternate ways to reach this service.
     */
    case altSvc
        
    /**
     Date
         
     Contains the date and time at which the message was originated.
     */
    case date
        
    /**
     Early-Data
         
     Indicates that the request has been conveyed in TLS early data.
         
     - Warning: Experimental
     */
    case earlyData
        
    /**
     Large-Allocation
         
     Tells the browser that the page being loaded is going to want to perform a large allocation.
         
     - Warning: Deprecated
     */
    case largeAllocation
        
    /**
     Link
         
     The `Link` entity-header field provides a means for serializing one or more links in HTTP headers. It is semantically equivalent to the HTML `<link> element.
     */
    case link
        
    /**
     Push-Policy
         
     A `Push-Policy` defines the server behavior regarding push when processing a request.
         
     - Warning: Experimental
     */
    case pushPolicy
        
    /**
     Retry-After
         
     Indicates how long the user agent should wait before making a follow-up request.
     */
    case retryAfter
        
    /**
     Signature
         
     The `Signature header field conveys a list of signatures for an exchange, each one accompanied by information about how to determine the authority of and refresh that signature.
         
     - Warning: Experimental
     */
    case signature
        
    /**
     Signed-Headers
         
     The `Signed-Headers` header field identifies an ordered list of response header fields to include in a signature.
         
     - Warning: Experimental
     */
    case signedHeaders
        
    /**
     Server-Timing
         
     Communicates one or more metrics and descriptions for the given request-response cycle.
     */
    case serverTiming
        
    /**
     Service-Worker-Allowed
         
     Used to remove the [path restriction](https://w3c.github.io/ServiceWorker/#path-restriction) by including this header [in the response of the Service Worker script.](https://w3c.github.io/ServiceWorker/#service-worker-script-response)
     */
    case serviceWorkerAllowed
        
    /**
     SourceMap
         
     Links generated code to a [source map.](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html)
     */
    case sourceMap
        
    /**
     Upgrade
         
     The relevant RFC document for the [Upgrade header field is RFC 9110, section 7.8.](https://httpwg.org/specs/rfc9110.html#field.upgrade) The standard establishes rules for upgrading or changing to a different protocol on the current client, server, transport protocol connection. For example, this header standard allows a client to change from HTTP 1.1 to [WebSocket](https://developer.mozilla.org/en-US/docs/Glossary/WebSockets), assuming the server decides to acknowledge and implement the Upgrade header field. Neither party is required to accept the terms specified in the Upgrade header field. It can be used in both client and server headers. If the Upgrade header field is specified, then the sender MUST also send the Connection header field with the upgrade option specified. For details on the Connection header field [please see section 7.6.1 of the aforementioned RFC.](https://httpwg.org/specs/rfc9110.html#field.connection)
     */
    case upgrade
        
    /**
     X-DNS-Prefetch-Control
         
     Controls DNS prefetching, a feature by which browsers proactively perform domain name resolution on both links that the user may choose to follow as well as URLs for items referenced by the document, including images, CSS, JavaScript, and so forth.
     */
    case xDNSPrefetchControl
        
    /**
     X-Firefox-Spdy
         
     - Warning: Deprecated, Non-standard
     */
    case xFirefoxSpdy
        
    /**
     X-Pingback
         
     - Warning: Non-standard
     */
    case xPingback
        
    /**
     X-Requested-With
     */
    case xRequestedWith
        
    /**
     X-Robots-Tag
         
     The `X-Robots-Tag HTTP header is used to indicate how a web page is to be indexed within public search engine results. The header is effectively equivalent to `<meta name="robots" content="…">`.
         
     - Warning: Non-standard
     */
    case xRobotsTag
        
    /**
     X-UA-Compatible
         
     Used by Internet Explorer to signal which document mode to use.
         
     - Warning: Non-standard
     */
    case xUACompatible
        
    // MARK: - Unknown

    /**
     Unknown case
     */
    case unknown(String)
}
