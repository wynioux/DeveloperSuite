//
//  LogView.swift
//  DeveloperSuiteLogging
//
//  Created by Bahadır A. Güder on 17.08.2023.
//

import ComposableArchitecture
import SwiftUI

public struct LogView: View {
    public init() {}

    public var body: some View {
        if #available(iOS 16.0, *) {
            LogListFeatureView(
                store: Store(initialState: LogListFeature.State()) {
                    LogListFeature()
                }
            )
        } else {
            Text("SA")
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
