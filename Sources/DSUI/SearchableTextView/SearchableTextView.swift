//
//  SearchableTextView.swift
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
public struct SearchableTextView: View {
    @ObservedObject var viewModel: SearchableTextViewModel

    public init(viewModel: SearchableTextViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        UITextViewRepresentableView(viewModel: viewModel)
            .searchable(text: $viewModel.searchText, placement: .automatic)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
    }
}

// MARK: Preview

@available(iOS 15, *)
struct SearchableTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableTextView(viewModel: .init())
    }
}
