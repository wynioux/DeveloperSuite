//
//  SwiftLog.swift
//  Integration
//
//  Created by Bahadır A. Güder on 26.07.2023.
//

import DeveloperSuite
import Foundation
import Logging

final class SwiftLog {
    static let shared = SwiftLog()

    let logger: Logger

    private init() {
        LoggingSystem.bootstrap(DeveloperSuiteLogHandler.init)
        self.logger = Logger(label: "io.github.wynioux.DeveloperSuite.Integration.SwiftLog")
    }
}
