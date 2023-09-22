//
//  TruncableListRowFeatureView.swift
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
struct TruncableListRowFeatureView: View {
    let store: Store<TruncableListRowFeature.State, TruncableListRowFeature.Action>

    // MARK: label

    func label(viewStore: ViewStore<TruncableListRowFeature.State, TruncableListRowFeature.Action>, mock: Bool = false) -> some View {
        HStack(spacing: 0) {
            Text(viewStore.state.title)
                .foregroundColor(Color(.label))

            Spacer()

            Text(viewStore.state.value)
                .foregroundColor(Color(.secondaryLabel))
                .lineLimit(1)
                .readSize {
                    guard mock else { return }
                    viewStore.send(.didTruncatedSizeChanged($0))
                }
                .background(
                    Text(viewStore.state.value)
                        .fixedSize(horizontal: false, vertical: true)
                        .hidden()
                        .readSize {
                            guard mock else { return }
                            viewStore.send(.didActualSizeChanged($0))
                        }
                )
        }
        .font(.body)
    }

    // MARK: body

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                label(viewStore: viewStore, mock: true)
                    .hidden()

                if viewStore.state.showNavigationLink {
                    NavigationLink(
                        destination: TruncableListRowDetailFeatureView(
                            store: Store(
                                initialState: TruncableListRowDetailFeature.State(
                                    title: viewStore.state.title,
                                    value: viewStore.state.value
                                ),
                                reducer: {
                                    TruncableListRowDetailFeature()
                                }
                            )
                        )
                    ) {
                        label(viewStore: viewStore)
                    }
                } else {
                    label(viewStore: viewStore)
                }
            }
        }
    }
}

// MARK: Preview

@available(iOS 16.0, *)
struct TruncableListRowFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                TruncableListRowFeatureView(
                    store: Store(initialState: TruncableListRowFeature.State(title: "UUID", value: UUID().uuidString)) {
                        TruncableListRowFeature()
                    }
                )
            }
        }
    }
}
