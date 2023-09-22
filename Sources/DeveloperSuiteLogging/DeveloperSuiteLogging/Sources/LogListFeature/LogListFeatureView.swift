//
//  LogListFeatureView.swift
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
struct LogListFeatureView: View {
    let store: Store<LogListFeature.State, LogListFeature.Action>

    init(store: Store<LogListFeature.State, LogListFeature.Action>) {
        self.store = store
        self.store.send(.repositoryDidCreateResultsController)
    }

    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(store, observe: \.entities) { viewStore in
                List {
                    Button("Add") {
                        viewStore.send(.addEntity)
                    }

                    ForEach(viewStore.state) { entity in
                        NavigationLink(state: LogDetailFeature.State(entity: entity)) {
                            createCell(for: entity)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Log")
            }

        } destination: { store in
            LogDetailFeatureView(store: store)
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: Preview

@available(iOS 16.0, *)
struct LogListFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        LogListFeatureView(
            store: Store(initialState: LogListFeature.State()) {
                LogListFeature()
            }
        )
    }
}

// MARK: CreateCell

@available(iOS 16.0, *)
extension LogListFeatureView {
    func createCell(for entity: LogEntity) -> some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Text(Image(systemName: "circlebadge.fill"))
                    .font(.footnote)
                    .padding(.trailing, 4)
                // .foregroundColor(entity.level.color)

                Text(entity.rawLevel)
                    .font(.callout)
                    .fontWeight(.medium)
                    .lineLimit(1)
                // .foregroundColor(entity.level.color)

                Spacer()

                Text(DateFormatter.cell.string(from: entity.createdAt))
                    .font(.system(.caption, design: .monospaced))
                    .fontWeight(.medium)
                    .foregroundColor(Color(.secondaryLabel))
            }

            Text(entity.message)
                .font(.body)
                .foregroundColor(Color(.label))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(entity.label)
                .font(.system(.footnote, design: .rounded))
                .foregroundColor(Color(.secondaryLabel))
                .lineLimit(1)
                .truncationMode(.head)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

public extension DateFormatter {
    static let cell: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        formatter.locale = .autoupdatingCurrent
        formatter.timeZone = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent

        return formatter
    }()
}
