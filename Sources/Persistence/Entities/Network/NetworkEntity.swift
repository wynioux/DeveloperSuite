//
//  NetworkEntity.swift
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

// MARK: NetworkEntity

public final class NetworkEntity: NSManagedObject, IdentifiableEntity {
    // MARK: Properties

    @NSManaged public var id: UUID
    @NSManaged public var createdAt: Date
    @NSManaged public var rawState: Int16
    @NSManaged public var originalRequest: NetworkRequestEntity
    @NSManaged public var currentRequest: NetworkRequestEntity
    @NSManaged public var response: NetworkResponseEntity?
    @NSManaged public var metrics: NetworkMetricsEntity?
    @NSManaged public var error: NetworkErrorEntity?

    // MARK: Convenience Initializer

    @discardableResult
    public convenience init(
        context: NSManagedObjectContext,
        id: UUID,
        state: HTTPState,
        originalRequest: NetworkRequestEntity,
        currentRequest: NetworkRequestEntity,
        response: NetworkResponseEntity? = nil,
        metrics: NetworkMetricsEntity? = nil,
        error: NetworkErrorEntity? = nil
    ) {
        self.init(context: context)

        self.id = id
        self.createdAt = Date()
        self.rawState = state.rawValue
        self.originalRequest = originalRequest
        self.currentRequest = currentRequest
        self.response = response
        self.metrics = metrics
        self.error = error
    }
}

// MARK: Property Extension

public extension NetworkEntity {
    var state: HTTPState {
        return HTTPState(rawValue: rawState)!
    }
}

// MARK: Functional Extension

extension NetworkEntity {
    static func description(
        networkRequestEntity: NSEntityDescription,
        networkResponseEntity: NSEntityDescription,
        networkMetricsEntity: NSEntityDescription,
        networkErrorEntity: NSEntityDescription
    ) -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "id", attributeType: .UUIDAttributeType),
            NSAttributeDescription(name: "createdAt", attributeType: .dateAttributeType),
            NSAttributeDescription(name: "rawState", attributeType: .integer16AttributeType),
            NSRelationshipDescription(name: "originalRequest", relationshipType: .oneToOne(), entityDescription: networkRequestEntity),
            NSRelationshipDescription(name: "currentRequest", relationshipType: .oneToOne(), entityDescription: networkRequestEntity),
            NSRelationshipDescription(name: "response", relationshipType: .oneToOne(isOptional: true), entityDescription: networkResponseEntity),
            NSRelationshipDescription(name: "metrics", relationshipType: .oneToOne(isOptional: true), entityDescription: networkMetricsEntity),
            NSRelationshipDescription(name: "error", relationshipType: .oneToOne(isOptional: true), entityDescription: networkErrorEntity)
        ]

        return entityDescription
    }
}
