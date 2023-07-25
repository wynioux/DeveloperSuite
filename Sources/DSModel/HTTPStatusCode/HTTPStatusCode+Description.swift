//
//  HTTPStatusCode+Description.swift
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

// MARK: Description

public extension HTTPStatusCode {
    var description: String {
        switch self {
        // Informational
        case .continue:
            return "This interim response indicates that the client should continue the request or ignore the response if the request is already finished."
            
        case .switchingProtocols:
            return "This code is sent in response to an `Upgrade` request header from the client and indicates theprotocol the server is switching to."
            
        case .processing:
            return "This code indicates that the server has received and is processing the request, but no response is available yet."
            
        case .earlyHints:
            return "This status code is primarily intended to be used with the `Link` header, letting the user agent start preloading resources while the server prepares a response."
            
        // Successful
        case .ok:
            return "The request succeeded."
            
        case .created:
            return "The request succeeded, and a new resource was created as a result. This is typically the response sent after `POST` requests, or some `PUT` requests."
            
        case .accepted:
            return "The request has been received but not yet acted upon. It is noncommittal, since there is no way in HTTP to later send an asynchronous response indicating the outcome of the request. It is intended for cases where another process or server handles the request, or for batch processing."
            
        case .nonAuthoritativeInformation:
            return "This response code means the returned metadata is not exactly the same as is available from the origin server, but is collected from a local or a third-party copy. This is mostly used for mirrors or backups of another resource. Except for that specific case, the **200 OK** response is preferred to this status."
            
        case .noContent:
            return "There is no content to send for this request, but the headers may be useful. The user agent may update its cached headers for this resource with the new ones."
            
        case .resetContent:
            return "Tells the user agent to reset the document which sent this request."
            
        case .partialContent:
            return "This response code is used when the Range header is sent from the client to request only part of a resource."
            
        case .multiStatus:
            return "Conveys information about multiple resources, for situations where multiple status codes might be appropriate."
            
        case .alreadyReported:
            return "Used inside a `<dav:propstat>` response element to avoid repeatedly enumerating the internal members of multiple bindings to the same collection."
            
        case .imUsed:
            return "The server has fulfilled a `GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance."
            
        // Redirection
        case .multipleChoices:
            return "The request has more than one possible response. The user agent or user should choose one of them."
            
        case .movedPermanently:
            return "The URL of the requested resource has been changed permanently. The new URL is given in the response."
            
        case .found:
            return "This response code means that the URI of requested resource has been changed temporarily. Further changes in the URI might be made in the future. Therefore, this same URI should be used by the client in future requests."
            
        case .seeOther:
            return "The server sent this response to direct the client to get the requested resource at another URI with a `GET request."
            
        case .notModified:
            return "This is used for caching purposes. It tells the client that the response has not been modified, so the client can continue to use the same cached version of the response."
            
        case .useProxy:
            return "Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy."
            
        case .unused:
            return "This response code is no longer used; it is just reserved. It was used in a previous version of the HTTP/1.1 specification."
            
        case .temporaryRedirect:
            return "The server sends this response to direct the client to get the requested resource at another URI with same method that was used in the prior request. This has the same semantics as the `302 Found` HTTP response code, with the exception that the user agent must not change the HTTP method used: if a `POST` was used in the first request, a `POST` must be used in the second request."
            
        case .permanentRedirect:
            return "This means that the resource is now permanently located at another URI, specified by the `Location` HTTP Response header. This has the same semantics as the `301 Moved Permanently` HTTP response code, with the exception that the user agent must not change the HTTP method used: if a `POST` was used in the first request, a `POST` must be used in the second request."
            
        // Client Error
        case .badRequest:
            return "The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing)."
            
        case .unauthorized:
            return "Although the HTTP standard specifies \"unauthorized\", semantically this response means \"unauthenticated\". That is, the client must authenticate itself to get the requested response."
            
        case .paymentRequired:
            return "This response code is reserved for future use. The initial aim for creating this code was using it for digital payment systems, however this status code is used very rarely and no standard convention exists."
            
        case .forbidden:
            return "The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource. Unlike `401 Unauthorized, the client's identity is known to the server."
            
        case .notFound:
            return "The server cannot find the requested resource. In the browser, this means the URL is not recognized. In an API, this can also mean that the endpoint is valid but the resource itself does not exist. Servers may also send this response instead of `403 Forbidden` to hide the existence of a resource from an unauthorized client. This response code is probably the most well known due to its frequent occurrence on the web."
            
        case .methodNotAllowed:
            return "The request method is known by the server but is not supported by the target resource. For example, an API may not allow calling `DELETE` to remove a resource."
            
        case .notAcceptable:
            return "This response is sent when the web server, after performing `server-driven content negotiation`, doesn't find any content that conforms to the criteria given by the user agent."
            
        case .proxyAuthenticationRequired:
            return "This is similar to `401 Unauthorized` but authentication is needed to be done by a proxy."
            
        case .requestTimeout:
            return "This response is sent on an idle connection by some servers, even without any previous request by the client. It means that the server would like to shut down this unused connection. This response is used much more since some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection mechanisms to speed up surfing. Also note that some servers merely shut down the connection without sending this message."
            
        case .conflict:
            return "This response is sent when a request conflicts with the current state of the server."
            
        case .gone:
            return "This response is sent when the requested content has been permanently deleted from server, with no forwarding address. Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be used for \"limited-time, promotional services\". APIs should not feel compelled to indicate resources that have been deleted with this status code."
            
        case .lengthRequired:
            return "Server rejected the request because the `Content-Length` header field is not defined and the server requires it."
            
        case .preconditionFailed:
            return "The client has indicated preconditions in its headers which the server does not meet."
            
        case .payloadTooLarge:
            return "Request entity is larger than limits defined by server. The server might close the connection or return an `Retry-After` header field."
            
        case .uriTooLong:
            return "The URI requested by the client is longer than the server is willing to interpret."
            
        case .unsupportedMediaType:
            return "The media format of the requested data is not supported by the server, so the server is rejecting the request."
            
        case .rangeNotSatisfiable:
            return "The range specified by the `Range` header field in the request cannot be fulfilled. It's possible that the range is outside the size of the target URI's data."
            
        case .expectationFailed:
            return "This response code means the expectation indicated by the `Expect` request header field cannot be met by the server."
            
        case .imATeapot:
            return "The server refuses the attempt to brew coffee with a teapot."
            
        case .misdirectedRequest:
            return "The request was directed at a server that is not able to produce a response. This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI."
            
        case .unprocessableEntity:
            return "The request was well-formed but was unable to be followed due to semantic errors."
            
        case .locked:
            return "The resource that is being accessed is locked."
            
        case .failedDependency:
            return "The request failed due to failure of a previous request."
            
        case .tooEarly:
            return "Indicates that the server is unwilling to risk processing a request that might be replayed."
            
        case .upgradeRequired:
            return "The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol. The server sends an `Upgrade` header in a 426 response to indicate the required protocol(s)."
            
        case .preconditionRequired:
            return "The origin server requires the request to be conditional. This response is intended to prevent the 'lost update' problem, where a client **GET**s a resource's state, modifies it and **PUT**s it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict."
            
        case .tooManyRequests:
            return "The user has sent too many requests in a given amount of time (\"rate limiting\")."
            
        case .requestHeaderFieldsTooLarge:
            return "The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields."
            
        case .unavailableForLegalReasons:
            return "The user agent requested a resource that cannot legally be provided, such as a web page censored by a government."
            
        // Server Error
        case .internalServerError:
            return "The server has encountered a situation it does not know how to handle."
            
        case .notImplemented:
            return "The request method is not supported by the server and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are `GET` and `HEAD`."
            
        case .badGateway:
            return "This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response."
            
        case .serviceUnavailable:
            return "The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded. Note that together with this response, a user-friendly page explaining the problem should be sent. This response should be used for temporary conditions and the Retry-After HTTP header should, if possible, contain the estimated time before the recovery of the service. The webmaster must also take care about the caching-related headers that are sent along with this response, as these temporary condition responses should usually not be cached."
            
        case .gatewayTimeout:
            return "This error response is given when the server is acting as a gateway and cannot get a response in time."
            
        case .httpVersionNotSupported:
            return "The HTTP version used in the request is not supported by the server."
            
        case .variantAlsoNegotiates:
            return "The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process."
            
        case .insufficientStorage:
            return "The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request."
            
        case .loopDetected:
            return "The server detected an infinite loop while processing the request."
            
        case .notExtended:
            return "Further extensions to the request are required for the server to fulfill it."
            
        case .networkAuthenticationRequired:
            return "Indicates that the client needs to authenticate to gain network access."
            
        // Unknown
        case .unknown:
            return "Unknown"
        }
    }
}
