//
//  DeveloperSuiteLog.swift
//  Integration
//
//  Created by Bahadır A. Güder on 26.07.2023.
//

import DeveloperSuite
import Foundation

final class DeveloperSuiteLog {
    static let shared = DeveloperSuiteLog()

    let logger: LogLogger

    private init() {
        self.logger = LogLogger(label: "io.github.wynioux.DeveloperSuite.Integration.DeveloperSuiteLog")
    }
}
