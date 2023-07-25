//
//  LogEntity.swift
//  DSPersistence
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

import CoreData
import DSModel

// MARK: LogEntity

public final class LogEntity: NSManagedObject, IdentifiableEntity {
    // MARK: Properties

    @NSManaged public var id: UUID
    @NSManaged public var createdAt: Date
    @NSManaged public var rawLevel: String
    @NSManaged public var message: String
    @NSManaged public var file: String
    @NSManaged public var function: String
    @NSManaged public var line: Int
    @NSManaged public var label: String
}

// MARK: Property Extension

public extension LogEntity {
    var level: LogLevel! {
        return LogLevel(rawValue: rawLevel)
    }
}

// MARK: Functional Extension

extension LogEntity {
    static func description() -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "id", attributeType: .UUIDAttributeType),
            NSAttributeDescription(name: "createdAt", attributeType: .dateAttributeType),
            NSAttributeDescription(name: "rawLevel", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "message", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "file", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "function", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "line", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "label", attributeType: .stringAttributeType)
        ]

        return entityDescription
    }
}
