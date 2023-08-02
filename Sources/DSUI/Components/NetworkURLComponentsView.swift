//
//  NetworkURLComponentsView.swift
//  DSUI
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

import SwiftUI

// MARK: View

@available(iOS 15, *)
public struct NetworkURLComponentsView: View {
    public let urlComponents: URLComponents

    public init(urlComponents: URLComponents) {
        self.urlComponents = urlComponents
    }

    public var body: some View {
        List {
            Section {
                Text("URL")
                    .fixedSize()
                    .badge(urlComponents.description)
            }

            Section {
                if let scheme = urlComponents.scheme {
                    Text("Scheme")
                        .fixedSize()
                        .badge(scheme)
                }

                if let host = urlComponents.host {
                    Text("Host")
                        .fixedSize()
                        .badge(host)
                }

                if let port = urlComponents.port {
                    Text("Port")
                        .fixedSize()
                        .badge(port)
                }

                if !urlComponents.path.isEmpty {
                    Text("Path")
                        .fixedSize()
                        .badge(urlComponents.path)
                }

                if let query = urlComponents.query {
                    if let queryItems = urlComponents.queryItems {
                        NavigationLink(destination: NetworkQueryItemsView(queryItems: queryItems)) {
                            Text("Query")
                                .fixedSize()
                                .badge(query)
                        }
                    } else {
                        Text("Query")
                            .fixedSize()
                            .badge(query)
                    }
                }
            }
        }
        .navigationTitle("URL Components")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

@available(iOS 15, *)
struct NetworkURLDetailView_Previews: PreviewProvider {
    static let urlComponents = URLComponents(string: "https://subdomain.domain.com/Controller/Method?name=Istanbul&id=34")!

    static var previews: some View {
        return NetworkURLComponentsView(urlComponents: urlComponents)
    }
}
