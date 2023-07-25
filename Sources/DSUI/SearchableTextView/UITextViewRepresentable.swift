//
//  UITextViewRepresentable.swift
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

// MARK: UITextViewRepresentable

struct UITextViewRepresentable: UIViewRepresentable {
    typealias UIViewType = UITextView

    let viewModel: SearchableTextViewModel

    func makeUIView(context: Context) -> UITextView {
        let textView: UITextView

        if #available(iOS 16, *) {
            // Disables the new TextKit 2 which is extremely slow on iOS 16
            textView = UITextView(usingTextLayoutManager: false)
        } else {
            textView = UITextView()
        }

        textView.backgroundColor = .clear
        textView.alwaysBounceVertical = true
        textView.keyboardDismissMode = .interactive
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.adjustsFontForContentSizeCategory = true
        textView.dataDetectorTypes = [.link]
        textView.isEditable = false
        textView.isSelectable = true
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        textView.linkTextAttributes = [.underlineStyle: 1]
        textView.delegate = context.coordinator
        textView.attributedText = viewModel.attributedText

        viewModel.textView = textView

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator()
        return coordinator
    }
}

// MARK: Coordinator

extension UITextViewRepresentable {
    final class Coordinator: NSObject, UITextViewDelegate {
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            return true
        }
    }
}
