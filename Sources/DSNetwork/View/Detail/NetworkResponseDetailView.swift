//
//  NetworkResponseDetailView.swift
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

import DSPersistence
import DSUI
import SwiftUI

// MARK: View

struct NetworkResponseDetailView: View {
    @ObservedObject var entity: NetworkEntity

    var response: NetworkResponseEntity {
        return entity.response!
    }

    var error: Error? {
        return entity.error?.underlyingError?.error
    }

    var body: some View {
        List {
            Section {
                if let urlComponents = response.urlComponents {
                    NavigationLink {
                        NetworkURLComponentsView(urlComponents: urlComponents)
                    } label: {
                        Text("URL")
                            .fixedSize()
                            .badge((response.urlComponents?.host ?? "") + (response.urlComponents?.path ?? ""))
                    }
                }

                if let httpHeaders = response.httpHeaders {
                    NavigationLink {
                        NetworkHTTPHeadersView(httpHeaders: httpHeaders)
                    } label: {
                        Text("Headers")
                            .fixedSize()
                            .badge(httpHeaders.count)
                    }
                }
            }

            Section {
                NavigationLink {
                    NetworkHTTPStatusCodeView(httpStatusCode: response.statusCode)
                } label: {
                    Text("Status Code")
                        .fixedSize()
                        .badge(response.statusCode.rawValue)
                }

                if let textEncodingName = response.textEncodingName {
                    Text("Text Encoding Name")
                        .fixedSize()
                        .badge(textEncodingName)
                }

                if let suggestedFilename = response.suggestedFilename {
                    Text("Suggested Filename")
                        .fixedSize()
                        .badge(suggestedFilename)
                }

                if let mimeType = response.mimeType {
                    Text("MIME")
                        .fixedSize()
                        .badge(mimeType.rawValue)
                }

                if let mimeType = response.mimeType,
                   !response.rawHTTPBody.isEmpty
                {
                    NavigationLink(destination: NetworkHTTPBodyView(httpBody: response.rawHTTPBody,
                                                                    httpMimeType: mimeType,
                                                                    error: error))
                    {
                        Text("Body")
                            .fixedSize()
                            .badge(ByteCountFormatter.cell.string(fromByteCount: response.expectedContentLength))
                    }
                }
            }
        }
        .navigationTitle("Response Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkResponseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkResponseDetailView(entity: NetworkEntity())
    }
}
