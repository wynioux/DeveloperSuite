//
//  LogDetailFeatureView.swift
//  DeveloperSuiteLogging
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

import ComposableArchitecture
import SwiftUI

// MARK: View

@available(iOS 16.0, *)
struct LogDetailFeatureView: View {
    let store: Store<LogDetailFeature.State, LogDetailFeature.Action>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List {
                Section {
                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Created At",
                                value: DateFormatter.detail.string(from: viewStore.entity.createdAt)
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Level",
                                value: viewStore.entity.rawLevel
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Label",
                                value: viewStore.entity.label
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )
                } header: {
                    Text("Log")
                }

                Section {
                    if let metadata = viewStore.entity.metadata {
                        TruncableListRowFeatureView(
                            store: Store(
                                initialState: TruncableListRowFeature.State(
                                    title: "Metadata",
                                    value: metadata
                                ),
                                reducer: {
                                    TruncableListRowFeature()
                                }
                            )
                        )
                    }

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Source",
                                value: viewStore.entity.source
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "File",
                                value: viewStore.entity.file
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Function",
                                value: viewStore.entity.function
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Line",
                                value: String(viewStore.entity.line)
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                    TruncableListRowFeatureView(
                        store: Store(
                            initialState: TruncableListRowFeature.State(
                                title: "Message",
                                value: viewStore.entity.message
                            ),
                            reducer: {
                                TruncableListRowFeature()
                            }
                        )
                    )

                } header: {
                    Text("Details")
                }
            }
            .navigationBarTitle("Log Details")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

@available(iOS 16.0, *)
struct LogDetailFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LogDetailFeatureView(
                store: Store(
                    initialState: LogDetailFeature.State(entity: .mock),
                    reducer: {
                        LogDetailFeature()
                    }
                )
            )
        }
    }
}

public extension DateFormatter {
    static let detail: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, EEE, HH:mm:ss"
        formatter.locale = .autoupdatingCurrent
        formatter.timeZone = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent

        return formatter
    }()
}
