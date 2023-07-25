//
//  URLSessionDelegateMiddleware+URLSessionDelegate.swift
//  DSNetwork
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

// MARK: URLSessionDelegate

extension URLSessionDelegateMiddleware: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        let selector: Selector = #selector(URLSessionDelegate.urlSession(_:didBecomeInvalidWithError:)
            as (URLSessionDelegate) -> ((URLSession, Error?) -> Void)?)

        defer { networkLogger.log(sessionDidBecomeInvalidWithError: error) }

        guard let urlSessionDelegate,
              urlSessionDelegate.responds(to: selector)
        else { return }

        urlSessionDelegate.urlSession!(session, didBecomeInvalidWithError: error)
    }

    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let selector: Selector = #selector(URLSessionDelegate.urlSession(_:didReceive:completionHandler:)
            as (URLSessionDelegate) -> ((URLSession, URLAuthenticationChallenge, @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void)?)

        var authChallengeDisposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
        var urlCredential: URLCredential? = nil

        defer { networkLogger.log(sessionDidReceive: challenge, authChallengeDisposition: authChallengeDisposition, urlCredential: urlCredential) }

        guard let urlSessionDelegate,
              urlSessionDelegate.responds(to: selector)
        else {
            return completionHandler(authChallengeDisposition, urlCredential)
        }

        urlSessionDelegate.urlSession!(session, didReceive: challenge) {
            authChallengeDisposition = $0
            urlCredential = $1

            completionHandler(authChallengeDisposition, urlCredential)
        }
    }

//    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?) {
//        let selector: Selector = #selector(URLSessionDelegate.urlSession(_:didReceive:)
//            as (URLSessionDelegate) -> ((URLSession, URLAuthenticationChallenge) async -> (URLSession.AuthChallengeDisposition, URLCredential?))?)
//
//        var authChallengeDisposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
//        var urlCredential: URLCredential? = nil
//
//        defer { networkLogger.log(sessionDidReceive: challenge, authChallengeDisposition: authChallengeDisposition, urlCredential: urlCredential) }
//
//        guard let urlSessionDelegate,
//              urlSessionDelegate.responds(to: selector)
//        else { return (authChallengeDisposition, urlCredential) }
//
//        (authChallengeDisposition, urlCredential) = await urlSessionDelegate.urlSession!(session, didReceive: challenge)
//
//        return (authChallengeDisposition, urlCredential)
//    }

    public func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        let selector: Selector = #selector(URLSessionDelegate.urlSessionDidFinishEvents(forBackgroundURLSession:)
            as (URLSessionDelegate) -> ((URLSession) -> Void?)?)

        defer { networkLogger.log(sessionDidFinishEventsForBackground: session) }

        guard let urlSessionDelegate,
              urlSessionDelegate.responds(to: selector)
        else { return }

        urlSessionDelegate.urlSessionDidFinishEvents!(forBackgroundURLSession: session)
    }
}
