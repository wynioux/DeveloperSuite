//
//  LogDetailView.swift
//  DSLog
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

struct LogDetailView: View {
    @ObservedObject var entity: LogEntity

    var body: some View {
        List {
            Section("LOG") {
                Text("Created At")
                    .fixedSize()
                    .badge(DateFormatter.detail.string(from: entity.createdAt))

                Text("Level")
                    .fixedSize()
                    .badge(
                        Text(entity.level.rawValue)
                            .foregroundColor(entity.level.color)
                    )

                Text("Label")
                    .fixedSize()
                    .badge(entity.label)
            }

            Section("DETAILS") {
                Text("File")
                    .fixedSize()
                    .badge(entity.file)

                Text("Function")
                    .fixedSize()
                    .badge(entity.function)

                Text("Line")
                    .fixedSize()
                    .badge(entity.line)

                NavigationLink("Message") {
                    SearchableTextView(viewModel:
                        SearchableTextViewModel(attributedText:
                            TextRenderer()
                                .preformatted(entity.message)))
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text(entity.level.rawValue)
                                    .font(.headline)
                                    .foregroundColor(entity.level.color)
                            }
                        }
                }
            }
        }
        .navigationTitle("Log Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(entity: LogEntity())
    }
}
