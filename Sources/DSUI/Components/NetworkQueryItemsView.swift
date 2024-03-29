//
//  NetworkQueryItemsView.swift
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
struct NetworkQueryItemsView: View {
    let queryItems: [URLQueryItem]

    var body: some View {
        List {
            ForEach(queryItems.sorted(by: { $0.name > $1.name }), id: \.hashValue) { item in
                Text(item.name)
                    .fixedSize()
                    .badge(item.value ?? "")
            }
        }
        .navigationTitle("Query Items")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

@available(iOS 15, *)
struct NetworkQueryItemsDetailView_Previews: PreviewProvider {
    static let queryItems: [URLQueryItem] = [
        .init(name: "nickname", value: "wynioux"),
        .init(name: "projectStart", value: "2023")
    ]

    static var previews: some View {
        NetworkQueryItemsView(queryItems: queryItems)
    }
}
