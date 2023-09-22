//
//  TruncableListRowFeature.swift
//  DeveloperSuiteLogging
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

import ComposableArchitecture
import Foundation

// MARK: TruncableListRowFeature

struct TruncableListRowFeature: Reducer {
    // MARK: State

    struct State: Equatable {
        let title: String
        let value: String
        var actualSize: CGSize = .zero
        var truncatedSize: CGSize = .zero
        var showNavigationLink: Bool = false
    }

    // MARK: Action

    enum Action: Equatable {
        case didActualSizeChanged(CGSize)
        case didTruncatedSizeChanged(CGSize)
        case shouldShowNavigationLink(Bool)
    }

    // MARK: Reducer

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .didActualSizeChanged(size):
                state.actualSize = size

                guard state.truncatedSize != .zero else { return .none }

                guard state.actualSize == state.truncatedSize else { return .send(.shouldShowNavigationLink(true)) }

                return .send(.shouldShowNavigationLink(false))

            case let .didTruncatedSizeChanged(size):
                state.truncatedSize = size

                guard state.actualSize != .zero else { return .none }

                guard state.truncatedSize == state.actualSize else { return .send(.shouldShowNavigationLink(true)) }

                return .send(.shouldShowNavigationLink(false))

            case let .shouldShowNavigationLink(bool):
                state.showNavigationLink = bool
                return .none
            }
        }
    }
}
