//
//  SearchToolbarView.swift
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

import DSModel
import SwiftUI

// MARK: View

struct SearchToolbarView: View {
    @ObservedObject var viewModel: SearchableTextViewModel
    var isKindNeeded: Bool = true

    private var options: some View {
        Menu {
            if let matchingRules = viewModel.searchOptions.eligibleMatchingRules(),
               isKindNeeded
            {
                Picker("Matching Rule: \(viewModel.searchOptions.matchingRule.rawValue)", selection: $viewModel.searchOptions.matchingRule) {
                    ForEach(matchingRules.sorted(by: { $0.rawValue > $1.rawValue }), id: \.self) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
            }

            Picker("Case Sensitivity: \(viewModel.searchOptions.caseSensitivity.rawValue)", selection: $viewModel.searchOptions.caseSensitivity) {
                ForEach(SearchOptions.CaseSensitivity.allCases.sorted(by: { $0.rawValue > $1.rawValue }), id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }

            Picker("Kind: \(viewModel.searchOptions.kind.rawValue)", selection: $viewModel.searchOptions.kind) {
                ForEach(SearchOptions.Kind.allCases.sorted(by: { $0.rawValue > $1.rawValue }), id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }

        } label: {
            Image(systemName: "ellipsis.circle")
                .font(.title3)
        }
        .pickerStyle(.menu)
        .fixedSize()
    }

    private var stepper: some View {
        HStack {
            Button {
                viewModel.previousMatch()
            } label: {
                Image(systemName: "chevron.left.circle")
                    .font(.title3)
            }
            .disabled(viewModel.matches.isEmpty)

            Text("\(viewModel.matches.isEmpty ? viewModel.selectedMatchIndex : viewModel.selectedMatchIndex + 1) of \(viewModel.matches.count)")
                .font(.body.monospacedDigit())

            Button {
                viewModel.nextMatch()
            } label: {
                Image(systemName: "chevron.right.circle")
                    .font(.title3)
            }
            .disabled(viewModel.matches.isEmpty)
        }
    }

    var body: some View {
        HStack {
            options
            stepper
        }
        .padding(12)
        .background(.regularMaterial)
        .cornerRadius(8, antialiased: true)
    }
}

// MARK: Preview

struct SearchToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchToolbarView(viewModel: .init())
    }
}
