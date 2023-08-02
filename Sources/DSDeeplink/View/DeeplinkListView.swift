//
//  DeeplinkListView.swift
//  DSDeeplink
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

@available(iOS 15, *)
struct DeeplinkListView: View {
    @Binding var queryItems: [URLQueryItem]?

    private var placeholder: some View {
        Text("")
            .hidden()
    }

    var body: some View {
        if let queryItems,
           !queryItems.isEmpty,
           let uuidString = queryItems.first(where: { $0.name == "id" })?.value
        {
            DynamicFetchRequestView(
                id: UUID(uuidString: uuidString)!,
                animation: .linear(duration: 0.2)
            ) { (results: FetchedResults<DeeplinkEntity>) in
                if let entity = results.first {
                    NavigationLink("", isActive: Binding(get: { self.queryItems != nil }, set: { _ in })) {
                        DeeplinkDetailView(entity: entity)
                            .onDisappear(perform: self.clearDeeplinkQuery)
                    }

                } else {
                    self.placeholder
                        .onAppear(perform: self.clearDeeplinkQuery)
                }
            }
        } else {
            DynamicFetchRequestView(
                sortDescriptors: [NSSortDescriptor(keyPath: \DeeplinkEntity.createdAt, ascending: false)],
                animation: .linear(duration: 0.2)
            ) { (results: FetchedResults<DeeplinkEntity>) in
                List {
                    if results.isEmpty {
                        EmptyCellView()
                    } else {
                        ForEach(results, id: \.objectID) { entity in
                            NavigationLink(destination: DeeplinkDetailView(entity: entity)) {
                                DeeplinkCellView(entity: entity)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .animation(.linear(duration: 0.2), value: results.isEmpty)
            }
        }
    }

    private func clearDeeplinkQuery() {
        guard self.queryItems != nil else { return }
        self.queryItems = nil
    }
}

// MARK: Preview

@available(iOS 15, *)
struct DeeplinkListView_Previews: PreviewProvider {
    static var previews: some View {
        DeeplinkListView(queryItems: .constant(nil))
    }
}
