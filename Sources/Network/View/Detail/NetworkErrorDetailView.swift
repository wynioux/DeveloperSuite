//
//  NetworkErrorDetailView.swift
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

import Persistence
import SwiftUI

// MARK: View

struct NetworkErrorDetailView: View {
    @ObservedObject var entity: NetworkErrorEntity

    var body: some View {
        List {
            Section {
                Text(entity.rawLocalizedDescription)

                Text("Code")
                    .badge(entity.rawCode)

                NavigationLink {
                    List {
                        Text(entity.underlyingError?.debugDescription ?? entity.rawDebugDescription)
                            .font(.system(.footnote, design: .monospaced))
                            .foregroundColor(Color(.secondaryLabel))
                    }
                    .navigationTitle("Debug Description")
                } label: {
                    Text("Debug Description")
                }
            }
        }
        .navigationTitle(entity.underlyingError?.domain ?? entity.rawDomain)
    }
}

// MARK: Preview

struct NetworkErrorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorDetailView(entity: NetworkErrorEntity())
    }
}
