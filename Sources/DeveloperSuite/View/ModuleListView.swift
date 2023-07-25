//
//  ModuleListView.swift
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

import SwiftUI
import UI

// MARK: ModuleListView

struct ModuleListView: View {
    @ObservedObject private var suiteState: DeveloperSuite = .default
    @ScaledMetric private var size: CGFloat = 1

    var body: some View {
        NavigationView {
            List {
                ForEach(Module.allCases, id: \.self) { module in
                    NavigationLink(
                        destination: module.destinationView(with: $suiteState.queryItems),
                        tag: module,
                        selection: $suiteState.selectedModule
                    ) {
                        Label(module.title, systemImage: module.imageSystemName)
                            .labelStyle(SettingsLikeLabelStyle(color: module.color, size: size))
                    }
                    .disabled(!module.featureEnabled)
                }
            }
            .navigationTitle("Developer Suite")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        suiteState.close()
                    } label: {
                        CloseButtonView()
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ModuleListView()
    }
}
