//
//  NetworkHTTPHeadersView.swift
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
import SwiftUI

// MARK: View

struct NetworkHTTPHeadersView: View {
    let httpHeaders: [HTTPHeader: String]

    var knownHeaders: [Dictionary<HTTPHeader, String>.Element] {
        return httpHeaders
            .lazy
            .filter {
                guard case .unknown = $0.key else { return true }
                return false
            }
            .sorted {
                $0.key.rawValue < $1.key.rawValue
            }
    }

    var unknownHeaders: [Dictionary<HTTPHeader, String>.Element] {
        return httpHeaders
            .lazy
            .filter {
                guard case .unknown = $0.key else { return false }
                return true
            }
            .sorted {
                $0.key.rawValue < $1.key.rawValue
            }
    }

    var body: some View {
        List {
            if !knownHeaders.isEmpty {
                Section("Known Headers") {
                    ForEach(knownHeaders, id: \.key.hashValue) { header in
                        Text(header.key.rawValue)
                            .fixedSize()
                            .badge(header.value)
                    }
                }
            }

            if !unknownHeaders.isEmpty {
                Section("Unknown Headers") {
                    ForEach(unknownHeaders, id: \.key.hashValue) { header in
                        Text(header.key.rawValue)
                            .fixedSize()
                            .badge(header.value)
                    }
                }
            }
        }
        .navigationTitle("Headers")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkHTTPHeadersView_Previews: PreviewProvider {
    static let httpHeaders: [HTTPHeader: String] = [.contentType: "application/json"]

    static var previews: some View {
        NetworkHTTPHeadersView(httpHeaders: httpHeaders)
    }
}
