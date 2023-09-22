//
//  LogListFeature.swift
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

// MARK: LogListFeature

struct LogListFeature: Reducer {
    @Dependency(\.persistentRepository) private var persistentRepository

    // MARK: State

    struct State: Equatable {
        let entityName: String = .init(describing: LogEntity.self)
        var predicate: NSPredicate? = nil
        var sortDescriptors: [NSSortDescriptor]? = [
            NSSortDescriptor(keyPath: \LogEntity.createdAt, ascending: false)
        ]

        var path = StackState<LogDetailFeature.State>()
        var entities: IdentifiedArrayOf<LogEntity> = []
    }

    // MARK: Action

    enum Action: Equatable {
        case path(StackAction<LogDetailFeature.State, LogDetailFeature.Action>)
        case addEntity
        case repositoryDidCreateResultsController
        case repositoryDidRetriveInitialObjects
        case repositoryDidListenForChanges
        case repositoryDidReceived(entities: [LogEntity])
    }

    // MARK: Reducer

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none

            case .addEntity:
                for _ in 1 ... 1 {
                    persistentRepository.writeContext.perform {
                        let entity = LogEntity(context: persistentRepository.writeContext)
                        entity.id = UUID()
                        entity.createdAt = Date()
                        entity.label = "io.github.wynioux.DeveloperSuite.DeveloperSuiteLogger"
                        entity.rawLevel = "info"
                        entity.message = "Hello, world!"
                        entity.source = #filePath
                        entity.file = #fileID
                        entity.function = #function
                        entity.line = #line

                        try? persistentRepository.writeContext.save()
                    }
                }

                return .none

            case .repositoryDidCreateResultsController:
                self.persistentRepository.createResultsController(entityName: state.entityName, predicate: state.predicate, sortDescriptors: state.sortDescriptors)

                return .send(.repositoryDidRetriveInitialObjects)
                    .concatenate(with: .send(.repositoryDidListenForChanges))

            case .repositoryDidRetriveInitialObjects:
                guard let objects = self.persistentRepository.retriveInitialObjects(),
                      let entities = objects as? [LogEntity]
                else { return .none }

                return .send(.repositoryDidReceived(entities: entities), animation: .linear)

            case .repositoryDidListenForChanges:
                let controllers = self.persistentRepository.controllerDidChangeContent()

                return .run { send in
                    await withTaskGroup(of: Void.self) { group in
                        for await controller in controllers {
                            guard let objects = controller.fetchedObjects,
                                  let entities = objects as? [LogEntity]
                            else { return }

                            group.addTask {
                                await send(.repositoryDidReceived(entities: entities), animation: .linear)
                            }
                        }
                    }
                }

            case let .repositoryDidReceived(entities):
                state.entities = IdentifiedArray(uniqueElements: entities)
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            LogDetailFeature()
        }
        ._printChanges()
    }
}
