//
//  ContentView.swift
//  iOS Example
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

import Alamofire
import DeveloperSuite
// import Logging
import SwiftUI

final class Custom {
    static let shared = Custom()

    let session: Session

    private init() {
        session = Session(eventMonitors: [TestEventMonitor()])
    }
}

// MARK: View

struct ContentView: View {
    /*
     let logger = Logger(label: "io.github.wynioux.iOSExample")

     init() {
         LoggingSystem.bootstrap(DeveloperSuiteLogHandler.init)
     }
     */

    var body: some View {
        VStack {
            Button("Open DeveloperSuite", action: openDeveloperSuite)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            Button("Alamofire", action: performAlamofireRequest)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            Button("Custom Alamofire", action: performCustomAlamofireRequest)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            Button("URLSession", action: performURLSessionSharedRequest)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            Button("Custom URLSession", action: performCustomURLSessionRequest)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            Button("Log", action: performLog)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }

    func openDeveloperSuite() {
        guard let url = URL(string: "iosexample://suite/open") else { return }
        UIApplication.shared.open(url)
    }

    func performAlamofireRequest() {
        let codes = ["100", "200", "300", "400", "500"]

        for _ in 1 ... 10 {
            AF
                .request("https://httpbin.org/status/\(codes.randomElement()!)")
                .validate()
                .responseDecodable(of: HTTPBinResponse.self) { response in
                    _ = response
                    print("Alamofire Network Response")
                }
        }
    }

    func performCustomAlamofireRequest() {
        Custom.shared.session
            .request("https://httpbin.org/post", method: .post, parameters: HTTPBinResponse(url: "https://subdomain.domain.com:8080/Controller/Method?name=Istanbul&id=34", origin: 1), encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: HTTPBinResponse.self) { response in
                _ = response
                print("Custom Alamofire Network Response")
            }
    }

    func performURLSessionSharedRequest() {
        let url = URL(string: "https://httpbin.org")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            _ = data
            _ = response
            _ = error

            print("URLSession Network Response")
        }

        task.resume()
    }

    func performCustomURLSessionRequest() {
        let url = URL(string: "https://subdomain.domain.com:8080/Controller/Method?name=Istanbul&id=34")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession(configuration: .default, delegate: TestURLSessionDelegate(), delegateQueue: nil)

        let task = session.dataTask(with: request)

        task.resume()

        session.finishTasksAndInvalidate()
    }

    func performLog() {
        logger.info("Test")
    }
}

struct HTTPBinResponse: Codable {
    let url: String
    let origin: Int
}

final class TestEventMonitor: EventMonitor {
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let task = request.task else { return }
        DeveloperSuite.default.network.logger.log(task, didFinishDecodingWithError: response.error?.underlyingError)
    }
}

final class TestURLSessionDelegate: NSObject, URLSessionDataDelegate {
    static let shared = TestURLSessionDelegate()
}

// MARK: Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
