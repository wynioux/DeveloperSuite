//
//  NetworkResponseEntity.swift
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
import DSModel

// MARK: NetworkResponseEntity

public final class NetworkResponseEntity: NSManagedObject {
    // MARK: Properties

    @NSManaged public var rawURL: URL
    @NSManaged public var rawStatusCode: Int
    @NSManaged public var rawMimeType: String?
    @NSManaged public var rawHTTPHeaders: Set<NetworkHeaderEntity>
    @NSManaged public var textEncodingName: String?
    @NSManaged public var suggestedFilename: String?
    @NSManaged public var expectedContentLength: Int64
    @NSManaged public var rawHTTPBody: Data
    @NSManaged public var rawHTTPBodySize: Int64

    // MARK: Convenience Initializer

    public convenience init(context: NSManagedObjectContext, response: HTTPURLResponse) {
        self.init(context: context)

        guard let url = response.url else {
            assertionFailure("Should be never nil.")
            return
        }

        self.rawURL = url
        self.rawStatusCode = response.statusCode
        self.rawMimeType = response.mimeType
        self.rawHTTPHeaders = Set((response.allHeaderFields as? [String: String])?.map { NetworkHeaderEntity(context: context, key: $0.key, value: $0.value) } ?? [])
        self.textEncodingName = response.textEncodingName
        self.suggestedFilename = response.suggestedFilename
        self.expectedContentLength = response.expectedContentLength
        self.rawHTTPBody = Data()
        self.rawHTTPBodySize = 0
    }
}

// MARK: Property Extension

public extension NetworkResponseEntity {
    var urlComponents: URLComponents? {
        return URLComponents(url: rawURL, resolvingAgainstBaseURL: false)
    }

    var statusCode: HTTPStatusCode {
        return HTTPStatusCode(rawValue: rawStatusCode)!
    }

    var mimeType: HTTPMimeType? {
        guard let rawMimeType else { return nil }
        return HTTPMimeType(rawValue: rawMimeType)!
    }

    var httpHeaders: [HTTPHeader: String]? {
        return Dictionary(uniqueKeysWithValues: rawHTTPHeaders.map { (HTTPHeader(rawValue: $0.key)!, $0.value) })
    }
}

// MARK: Functional Extension

extension NetworkResponseEntity {
    static func description(networkHeaderEntity: NSEntityDescription) -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "rawURL", attributeType: .URIAttributeType),
            NSAttributeDescription(name: "rawStatusCode", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawMimeType", attributeType: .stringAttributeType, isOptional: true),
            NSRelationshipDescription(name: "rawHTTPHeaders", relationshipType: .oneToMany, entityDescription: networkHeaderEntity),
            NSAttributeDescription(name: "textEncodingName", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "suggestedFilename", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "expectedContentLength", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawHTTPBody", attributeType: .binaryDataAttributeType),
            NSAttributeDescription(name: "rawHTTPBodySize", attributeType: .integer64AttributeType)
        ]

        return entityDescription
    }
}
