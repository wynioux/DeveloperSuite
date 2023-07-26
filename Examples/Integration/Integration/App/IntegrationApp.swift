//
//  IntegrationApp.swift
//  Integration
//
//  Created by Bahadır A. Güder on 25.07.2023.
//

import DeveloperSuite
import SwiftUI

@main
struct IntegrationApp: App {
    init() {
        URLProtocolMiddleware.shared.enable()
        URLSessionDelegateMiddleware.enable()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .developerSuite()
        }
    }
}
