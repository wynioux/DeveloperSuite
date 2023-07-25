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

import Deeplink
import Foundation
import Log
import Model
import Network
import Persistence

@_exported import struct Log.DeveloperSuiteLogHandler

// MARK: DeveloperSuite

public final class DeveloperSuite: ObservableObject {
    // MARK: Properties

    public static let `default` = DeveloperSuite(deeplink: .default, log: .default, network: .default, persistence: .default)

    // State
    @Published private(set) var isPresented: Bool = false
    @Published var queryItems: [URLQueryItem]? = nil
    @Published var selectedModule: Module?

    // API
    internal let deeplink: Deeplink
    public let log: Log
    public let network: Network
    internal let persistence: Persistence

    // MARK: Initializer

    init(deeplink: Deeplink, log: Log, network: Network, persistence: Persistence) {
        self.deeplink = deeplink
        self.log = log
        self.network = network
        self.persistence = persistence
    }

    private func resetSelectedModule() {
        guard selectedModule != nil else { return }
        selectedModule = nil
    }

    private func open(selectedModule: Module? = nil, with queryItems: [URLQueryItem]? = nil) {
        resetSelectedModule()

        self.selectedModule = selectedModule
        self.queryItems = queryItems

        isPresented = true
    }

    func close() {
        isPresented = false
    }

    func handle(action: DeeplinkAction, with queryItems: [URLQueryItem]? = nil) {
        switch action {
        // swiftformat:disable all
        case .open:         open()
        case .close:        close()
        case .bundle:       open(selectedModule: .bundle, with: queryItems)
        case .deeplink:     open(selectedModule: .deeplink, with: queryItems)
        case .device:       open(selectedModule: .device, with: queryItems)
        case .log:          open(selectedModule: .log, with: queryItems)
        case .network:      open(selectedModule: .network, with: queryItems)
        case .notification: open(selectedModule: .notification, with: queryItems)
        case .userdefaults: open(selectedModule: .userdefaults, with: queryItems)
        case .permission:   open(selectedModule: .permission, with: queryItems)
        case .settings:     open(selectedModule: .settings, with: queryItems)
        case .unknown:      break
        // swiftformat:enable all
        }
    }
}

// MARK: Configuration

extension DeveloperSuite {
    enum Configuration {
        static let version: String = "0.0.1-alpha.1"
    }
}
