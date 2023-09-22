//
//  LogEntity.swift
//  DeveloperSuitePersistence
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
import CoreData

// MARK: LogEntity

public final class LogEntity: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var createdAt: Date
    @NSManaged public var label: String
    @NSManaged public var rawLevel: String
    @NSManaged public var message: String
    @NSManaged public var metadata: String?
    @NSManaged public var source: String
    @NSManaged public var file: String
    @NSManaged public var function: String
    @NSManaged public var line: Int
}

// MARK: Identifiable

extension LogEntity: Identifiable {}

// MARK: NSEntityDescription

extension LogEntity {
    static func makeEntityDescription() -> NSEntityDescription {
        let description = NSEntityDescription(for: Self.self)

        description.properties = [
            NSAttributeDescription(name: "id", attributeType: .UUIDAttributeType),
            NSAttributeDescription(name: "createdAt", attributeType: .dateAttributeType),
            NSAttributeDescription(name: "label", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "rawLevel", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "message", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "metadata", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "source", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "file", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "function", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "line", attributeType: .integer64AttributeType)
        ]

        return description
    }
}

extension NSAttributeDescription {
    convenience init(name: String, attributeType: NSAttributeType, isOptional: Bool = false) {
        self.init()
        self.name = name
        self.attributeType = attributeType
        self.isOptional = isOptional
    }
}

public extension NSEntityDescription {
    convenience init<T: NSManagedObject>(for class: T.Type) {
        self.init()
        self.name = String(describing: T.self)
        self.managedObjectClassName = NSStringFromClass(T.self)
    }
}

// MARK: Mock

extension LogEntity {
    static let mock: LogEntity = {
        @Dependency(\.persistentRepository.writeContext) var context

        let entity = LogEntity(context: context)
        entity.id = UUID()
        entity.createdAt = Date()
        entity.label = "io.github.wynioux.DeveloperSuite.DeveloperSuiteLogger"
        entity.rawLevel = "info"
        entity.message = "Hello, world!"
        entity.source = #filePath
        entity.file = #fileID
        entity.function = #function
        entity.line = #line

        return entity
    }()
}
