//
//  DeveloperSuiteViewModifier.swift
//  DeveloperSuite
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

// MARK: DeveloperSuiteViewModifier

@available(iOS 15, *)
private struct DeveloperSuiteViewModifier: ViewModifier {
    @ObservedObject private var suite: DeveloperSuite = .default
    @ScaledMetric private var size: CGFloat = 1

    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(1)

            if suite.presented {
                NavigationView {
                    List {
                        ForEach(Module.allCases, id: \.self) { module in
                            ModuleCellView(suite: suite, module: module)
                        }
                    }
                    .navigationTitle("Developer Suite")
                    .toolbar { CloseToolbarItem(close: suite.close) }
                }
                .navigationViewStyle(.stack)
                .environment(\.managedObjectContext, suite.persistence.store.viewContext)
                .zIndex(2)
                .transition(.move(edge: .bottom))
            }
        }
        .animation(.linear(duration: 0.2), value: suite.presented)
        .onOpenURL { url in
            suite.deeplink.logger.log(url)
            guard let (module, queryItems) = suite.deeplink.resolver.resolve(url) else { return }
            suite.open(selectedModule: module, with: queryItems)
        }
    }
}

// MARK: DeveloperSuite

@available(iOS 15, *)
public extension View {
    func developerSuite() -> some View {
        modifier(DeveloperSuiteViewModifier())
    }
}
