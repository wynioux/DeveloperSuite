//
//  NetworkHTTPStatusCodeView.swift
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

struct NetworkHTTPStatusCodeView: View {
    let httpStatusCode: HTTPStatusCode

    var body: some View {
        List {
            Section {
                Text("Code")
                    .fixedSize()
                    .badge(
                        Text(String(httpStatusCode.rawValue))
                            .foregroundColor(httpStatusCode.color)
                    )

                Text("Title")
                    .fixedSize()
                    .badge(
                        Text(httpStatusCode.title)
                            .foregroundColor(httpStatusCode.color)
                    )
            } footer: {
                Text(httpStatusCode.description)
            }
        }
        .navigationTitle("Status Code")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkHTTPStatusCodeView_Previews: PreviewProvider {
    static let httpStatusCode: HTTPStatusCode = .unavailableForLegalReasons

    static var previews: some View {
        NetworkHTTPStatusCodeView(httpStatusCode: httpStatusCode)
    }
}
