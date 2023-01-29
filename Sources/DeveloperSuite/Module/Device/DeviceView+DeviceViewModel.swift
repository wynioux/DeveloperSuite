//
//  File.swift
//
//
//  Created by Bahadır A. Güder on 27.01.2023.
//

import Foundation

// MARK: DeviceViewModel

extension DeviceView {
    @MainActor final class DeviceViewModel: ObservableObject {
        @Published var selection: Submodule? = nil

        // MARK: Initializer

        init() {}
    }
}
