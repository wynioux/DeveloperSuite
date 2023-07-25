//
//  NetworkDetailView.swift
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

import DSModel
import DSPersistence
import SwiftUI

// MARK: View

struct NetworkDetailView: View {
    @ScaledMetric var size: CGFloat = 1
    @ObservedObject var entity: NetworkEntity

    var body: some View {
        List {
            Section("TASK") {
                Text("Created At")
                    .fixedSize()
                    .badge(DateFormatter.detail.string(from: entity.createdAt))

                Text("State")
                    .fixedSize()
                    .badge(
                        Text(entity.state.description)
                            .foregroundColor(entity.state.color)
                            .fontWeight(.medium)
                    )
            }
            .animation(.linear(duration: 0.1), value: entity.state)

            Section("DETAILS") {
                NavigationLink(destination: NetworkRequestDetailView(originalEntity: entity.originalRequest, currentEntity: entity.currentRequest)) {
                    Text("Request")
                        .fixedSize()
                        .badge(entity.originalRequest.httpMethod.rawValue)
                }

                if let response = entity.response {
                    NavigationLink(destination: NetworkResponseDetailView(entity: entity)) {
                        Text("Response")
                            .fixedSize()
                            .badge(
                                Text(String(response.statusCode.rawValue))
                                    .foregroundColor(response.statusCode.color)
                            )
                    }
                }

                if let metrics = entity.metrics {
                    NavigationLink(destination: NetworkMetricsDetailView(entity: metrics)) {
                        Text("Metrics")
                            .fixedSize()
                            .badge(DurationFormatter.string(from: TimeInterval(metrics.duration), isPrecise: false))
                    }
                }

                if let error = entity.error {
                    NavigationLink(destination: NetworkErrorDetailView(entity: error)) {
                        Text("Error")
                            .fixedSize()
                            .badge(error.rawCode)
                    }
                }
            }
            .animation(.linear(duration: 0.1), value: entity.response)
            .animation(.linear(duration: 0.1), value: entity.metrics)
            .animation(.linear(duration: 0.1), value: entity.error)
        }
        .navigationTitle((entity.originalRequest.urlComponents?.host ?? "") + (entity.originalRequest.urlComponents?.path ?? ""))
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkDetailView(entity: NetworkEntity())
    }
}
