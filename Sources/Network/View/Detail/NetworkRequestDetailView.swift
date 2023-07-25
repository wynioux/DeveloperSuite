//
//  NetworkRequestDetailView.swift
//  Network
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

import Model
import Persistence
import SwiftUI
import UI

// MARK: View

struct NetworkRequestDetailView: View {
    @ObservedObject var originalEntity: NetworkRequestEntity
    @ObservedObject var currentEntity: NetworkRequestEntity

    @State private var selectedEntity: NetworkRequestEntity

    init(originalEntity: NetworkRequestEntity, currentEntity: NetworkRequestEntity) {
        self.originalEntity = originalEntity
        self.currentEntity = currentEntity
        self.selectedEntity = currentEntity
    }

    var body: some View {
        List {
            Section {
                Picker("", selection: $selectedEntity) {
                    Text("Original Request")
                        .tag(originalEntity)

                    Text("Current Request")
                        .tag(currentEntity)
                }
                .pickerStyle(.segmented)
            }

            Section {
                if let urlComponents = selectedEntity.urlComponents {
                    NavigationLink {
                        NetworkURLComponentsView(urlComponents: urlComponents)
                    } label: {
                        Text("URL")
                            .badge((urlComponents.host ?? "") + urlComponents.path)
                    }
                }

                if !selectedEntity.httpHeaders.isEmpty {
                    NavigationLink {
                        NetworkHTTPHeadersView(httpHeaders: selectedEntity.httpHeaders)
                    } label: {
                        Text("Headers")
                            .badge(selectedEntity.httpHeaders.count)
                    }
                }
            }

            Section {
                NavigationLink {
                    List {
                        Text(selectedEntity.httpMethod.description)
                    }
                    .navigationTitle(selectedEntity.httpMethod.rawValue)
                    .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Text("Method")
                        .badge(selectedEntity.httpMethod.rawValue)
                }

                if let mainDocumentURLComponents = selectedEntity.mainDocumentURLComponents {
                    NavigationLink {
                        NetworkURLComponentsView(urlComponents: mainDocumentURLComponents)
                    } label: {
                        Text("Main Document URL")
                            .badge((mainDocumentURLComponents.host ?? "") + mainDocumentURLComponents.path)
                    }
                }

                if let httpBody = selectedEntity.rawHTTPBody {
                    NavigationLink(destination: NetworkHTTPBodyView(httpBody: httpBody, httpMimeType: .json)) {
                        Text("Body")
                            .badge(ByteCountFormatter.cell.string(fromByteCount: selectedEntity.rawHTTPBodySize))
                    }
                }
            }

            Section {
                Text("Timeout Interval")
                    .badge(DurationFormatter.string(from: selectedEntity.timeoutInterval, isPrecise: false))

                Text("Cache Policy")
                    .badge(selectedEntity.cachePolicy.description)

                Text("Network Service Type")
                    .badge(selectedEntity.networkServiceType.description)

                Text("Attribution")
                    .badge(selectedEntity.attribution.description)
            }

            Section {
                Text("Cellular Access")
                    .badge(selectedEntity.allowsCellularAccess ? "True" : "False")

                Text("Constrained Network Access")
                    .badge(selectedEntity.allowsConstrainedNetworkAccess ? "True" : "False")

                Text("Expensive Network Access")
                    .badge(selectedEntity.allowsExpensiveNetworkAccess ? "True" : "False")

                Text("Assumes HTTP/3 Capable")
                    .badge(selectedEntity.assumesHTTP3Capable ? "True" : "False")
            }
        }
        .navigationTitle("Request Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkRequestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkRequestDetailView(originalEntity: NetworkRequestEntity(), currentEntity: NetworkRequestEntity())
    }
}
