//
//  File.swift
//  
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import SwiftUI
// MARK: Submodule
extension DeviceView.DeviceViewModel {
    enum Submodule {
        case os
    }
}

// MARK: CaseIterable

extension DeviceView.DeviceViewModel.Submodule: CaseIterable {}

// MARK: Hashable

extension DeviceView.DeviceViewModel.Submodule: Hashable {}

// MARK: title

extension DeviceView.DeviceViewModel.Submodule {
    var title: String {
        switch self {
        // swiftformat:disable all
        case .os: return "OS"
        // swiftformat:enable all
        }
    }
}

// MARK: imageSystemName

extension DeviceView.DeviceViewModel.Submodule {
    var imageSystemName: String {
        switch self {
        // swiftformat:disable all
        case .os: return "terminal"
        // swiftformat:enable all
        }
    }
}

extension DeviceView.DeviceViewModel.Submodule {
    var color: Color {
        switch self {
        // swiftformat:disable all
        case .os: return Color(.systemGray)
        // swiftformat:enable all
        }
    }
}

// MARK: view

extension DeviceView.DeviceViewModel.Submodule {
    var view: some View {
        switch self {
        case .os: return AnyView(
                OSView()
                    .navigationTitle(self.title)
                    .navigationBarTitleDisplayMode(.inline)
            )
        }
    }
}
