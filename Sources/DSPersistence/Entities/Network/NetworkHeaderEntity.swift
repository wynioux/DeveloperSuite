//
//  NetworkHeaderEntity.swift
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
import DSExtension

// MARK: NetworkHeaderEntity

public final class NetworkHeaderEntity: NSManagedObject, Identifiable {
    // MARK: Properties

    @NSManaged public var key: String
    @NSManaged public var value: String

    // MARK: Convenience Initializer

    public convenience init(context: NSManagedObjectContext, key: String, value: String) {
        self.init(context: context)

        self.key = key
        self.value = value
    }
}

// MARK: Functional Extension

extension NetworkHeaderEntity {
    static func description() -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "key", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "value", attributeType: .stringAttributeType)
        ]

        return entityDescription
    }
}
