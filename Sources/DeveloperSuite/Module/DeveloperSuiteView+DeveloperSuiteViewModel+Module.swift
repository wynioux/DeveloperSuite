//
//  DeveloperSuiteView+DeveloperSuiteViewModel+Module.swift
//
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import SwiftUI

// MARK: Module

extension DeveloperSuiteView.DeveloperSuiteViewModel {
    enum Module {
        case bundle
        case deviceInfo
        case logs
        case network
        case userdefaults
    }
}

// MARK: CaseIterable

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module: CaseIterable {}

// MARK: Hashable

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module: Hashable {}

// MARK: title

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module {
    var title: String {
        switch self {
        // swiftformat:disable all
        case .bundle:       return "Bundle"
        case .deviceInfo:   return "Device"
        case .logs:         return "Logs"
        case .network:      return "Network"
        case .userdefaults: return "Userdefaults"
        // swiftformat:enable all
        }
    }
}

// MARK: imageSystemName

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module {
    var imageSystemName: String {
        switch self {
        // swiftformat:disable all
        case .bundle:       return "app.badge"
        case .deviceInfo:   return "iphone"
        case .logs:         return "doc.text"
        case .network:      return "network"
        case .userdefaults: return "list.bullet"
        // swiftformat:enable all
        }
    }
}

// MARK: color

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module {
    var color: Color {
        switch self {
        // swiftformat:disable all
        case .bundle:       return Color(.systemRed)
        case .deviceInfo:   return Color(.systemBlue)
        case .logs:         return Color(.systemOrange)
        case .network:      return Color(.systemGreen)
        case .userdefaults: return Color(.systemIndigo)
        // swiftformat:enable all
        }
    }
}

// MARK: view

extension DeveloperSuiteView.DeveloperSuiteViewModel.Module {
    var view: some View {
        switch self {
        case .bundle: return AnyView(
                BundleView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )

        case .deviceInfo: return AnyView(
                DeviceView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )

        case .logs: return AnyView(
                LogsView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )

        case .network: return AnyView(
                NetworkView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )

        case .userdefaults: return AnyView(
                UserdefaultsView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )
        }
    }
}
