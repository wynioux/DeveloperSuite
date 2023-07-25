//
//  NetworkErrorEntity.swift
//  Persistence
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
import Model

// MARK: NetworkErrorEntity

public final class NetworkErrorEntity: NSManagedObject {
    // MARK: Properties

    @NSManaged public var rawDomain: String
    @NSManaged public var rawCode: Int
    @NSManaged public var rawLocalizedDescription: String
    @NSManaged public var rawDebugDescription: String
    @NSManaged public var rawUnderlyingError: Data?

    // MARK: Convenience Initializer

    public convenience init(context: NSManagedObjectContext, error: Error) {
        self.init(context: context)

        let error = error as NSError

        self.rawDomain = error.domain
        self.rawCode = error.code
        self.rawLocalizedDescription = error.localizedDescription
        self.rawDebugDescription = error.debugDescription
        self.rawUnderlyingError = try? JSONEncoder().encode(UnderlyingError(error))
    }

    public lazy var underlyingError: UnderlyingError? = {
        guard let rawUnderlyingError = rawUnderlyingError else { return nil }
        return try? JSONDecoder().decode(UnderlyingError.self, from: rawUnderlyingError)
    }()
}

// MARK: Functional Extension

extension NetworkErrorEntity {
    static func description() -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "rawDomain", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "rawCode", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawLocalizedDescription", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "rawDebugDescription", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "rawUnderlyingError", attributeType: .binaryDataAttributeType, isOptional: true)
        ]

        return entityDescription
    }
}
