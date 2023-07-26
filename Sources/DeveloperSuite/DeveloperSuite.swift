//
//  DeveloperSuite.swift
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

import DSDeeplink
import DSLog
import DSModel
import DSNetwork
import DSPersistence
import SwiftUI

// MARK: DeveloperSuite

public final class DeveloperSuite: ObservableObject {
    // MARK: Properties

    public static let `default` = DeveloperSuite(deeplink: .default, persistence: .default)

    // State
    @Published private(set) var presented: Bool = false
    @Published var queryItems: [URLQueryItem]? = nil
    @Published var selectedModule: Module?

    // API
    internal let deeplink: Deeplink
    internal let persistence: Persistence

    // MARK: Initializer

    init(deeplink: Deeplink, persistence: Persistence) {
        self.deeplink = deeplink
        self.persistence = persistence
    }

    private func resetSelectedModule() {
        guard selectedModule != nil else { return }
        selectedModule = nil
    }

    func open(selectedModule: Module? = nil, with queryItems: [URLQueryItem]? = nil) {
        resetSelectedModule()

        self.selectedModule = selectedModule
        self.queryItems = queryItems

        presented = true
    }

    func close() {
        presented = false
    }

    @ViewBuilder
    func createDestinationView(for module: Module, with queryItems: Binding<[URLQueryItem]?>) -> some View {
        switch module {
        // swiftformat:disable all
        case .bundle:       EmptyView()
        case .deeplink:     DeeplinkView(queryItems: queryItems)
        case .device:       EmptyView()
        case .log:          LogView(queryItems: queryItems)
        case .network:      NetworkView(queryItems: queryItems)
        case .notification: EmptyView()
        case .userdefaults: EmptyView()
        case .permission:   EmptyView()
        case .settings:     EmptyView()
        // swiftformat:enable all
        }
    }
}

// MARK: Configuration

extension DeveloperSuite {
    enum Configuration {
        static let version: String = "0.0.1-alpha.4"
    }
}
