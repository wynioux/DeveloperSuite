//
//  NetworkHTTPBodyView.swift
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
import DSUI
import SwiftUI

// MARK: View

struct NetworkHTTPBodyView: View {
    let httpBody: Data
    let httpMimeType: HTTPMimeType
    let error: Error?

    init(httpBody: Data, httpMimeType: HTTPMimeType = .json, error: Error? = nil) {
        self.httpBody = httpBody
        self.httpMimeType = httpMimeType
        self.error = error
    }

    @ViewBuilder
    var createView: some View {
        switch httpMimeType {
        case .htm, .html, .jpeg, .jpg, .pdf, .png, .txt:
            EmptyView()

        case .json:
            if let json = try? JSONSerialization.jsonObject(with: httpBody) {
                SearchableTextView(viewModel:
                    SearchableTextViewModel(attributedText:
                        TextRenderer()
                            .render(json: json,
                                    codableDecodingError: error as? CodableDecodingError)))
            } else {
                SearchableTextView(viewModel:
                    SearchableTextViewModel(attributedText:
                        TextRenderer()
                            .preformatted(String(data: httpBody, encoding: .utf8) ?? "")))
            }

        default:
            EmptyView()
        }
    }

    var body: some View {
        createView
            .navigationTitle("Body")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct NetworkHTTPBodyView_Previews: PreviewProvider {
    static let data: Data = """
    {
        "stringKey": "Hello, World!",
        "numberKey": 42,
        "booleanKey": true,
        "nullKey": null,
        "arrayKey": [
            1,
            2,
            3
        ],
        "objectKey": {
            "nestedStringKey": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur tortor a faucibus. Nullam nec neque eget enim pulvinar fringilla. Morbi eget est tortor. Sed interdum turpis vel augue efficitur, id rhoncus dui sagittis. Suspendisse consectetur sagittis mauris, at congue justo semper a. Nulla facilisi. Sed sagittis nisi eu fermentum rhoncus. Nam dignissim mauris turpis, nec malesuada nunc sollicitudin in. Aliquam auctor finibus enim, a ultricies tortor blandit at. Nullam vel efficitur velit, non ullamcorper leo. Nullam eleifend enim turpis, a egestas massa rhoncus in. Sed placerat malesuada mauris, non feugiat est laoreet et.",
            "nestedNumberKey": 3.14
        }
    }
    """
    .data(using: .utf8)!

    static let httpMimeType: HTTPMimeType = .json

    static var previews: some View {
        NetworkHTTPBodyView(httpBody: data, httpMimeType: httpMimeType)
    }
}
