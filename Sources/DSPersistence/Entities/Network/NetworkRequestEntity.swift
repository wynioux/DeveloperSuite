//
//  NetworkRequestEntity.swift
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

// MARK: NetworkRequestEntity

public final class NetworkRequestEntity: NSManagedObject {
    // MARK: Properties

    @NSManaged public var rawURL: URL
    @NSManaged public var rawHTTPMethod: String
    @NSManaged public var rawHTTPBody: Data?
    @NSManaged public var rawHTTPBodySize: Int64
    @NSManaged public var rawHTTPHeaders: Set<NetworkHeaderEntity>
    @NSManaged public var rawMainDocumentURL: URL?
    @NSManaged public var rawCachePolicy: UInt
    @NSManaged public var rawNetworkServiceType: UInt
    @NSManaged public var rawAttribution: UInt
    @NSManaged public var rawTimeoutInterval: Double
    @NSManaged public var allowsCellularAccess: Bool
    @NSManaged public var allowsConstrainedNetworkAccess: Bool
    @NSManaged public var allowsExpensiveNetworkAccess: Bool
    @NSManaged public var assumesHTTP3Capable: Bool

    // MARK: Convenience Initializer

    public convenience init(context: NSManagedObjectContext, request: URLRequest) {
        self.init(context: context)

        guard let url = request.url,
              let httpMethod = request.httpMethod
        else {
            assertionFailure("Should be never nil.")
            return
        }

        self.rawURL = url
        self.rawHTTPMethod = httpMethod
        self.rawHTTPBody = request.httpBody ?? request.httpBodyStreamData()
        self.rawHTTPBodySize = Int64(rawHTTPBody?.count ?? 0)
        self.rawHTTPHeaders = Set(request.allHTTPHeaderFields?.map { NetworkHeaderEntity(context: context, key: $0.key, value: $0.value) } ?? [])
        self.rawMainDocumentURL = request.mainDocumentURL
        self.rawCachePolicy = request.cachePolicy.rawValue
        self.rawNetworkServiceType = request.networkServiceType.rawValue
        self.rawTimeoutInterval = request.timeoutInterval
        self.allowsCellularAccess = request.allowsCellularAccess
        self.allowsConstrainedNetworkAccess = request.allowsConstrainedNetworkAccess
        self.allowsExpensiveNetworkAccess = request.allowsExpensiveNetworkAccess

        if #available(iOS 15, *) {
            self.rawAttribution = request.attribution.rawValue
            self.assumesHTTP3Capable = request.assumesHTTP3Capable
        }
    }
}

// MARK: Property Extension

public extension NetworkRequestEntity {
    var urlComponents: URLComponents? {
        return URLComponents(url: rawURL, resolvingAgainstBaseURL: false)
    }

    var httpMethod: HTTPMethod {
        return HTTPMethod(rawValue: rawHTTPMethod)!
    }

    var httpHeaders: [HTTPHeader: String] {
        return Dictionary(uniqueKeysWithValues: rawHTTPHeaders.map { (HTTPHeader(rawValue: $0.key)!, $0.value) })
    }

    var mainDocumentURLComponents: URLComponents? {
        guard let mainDocumentURL = rawMainDocumentURL else { return nil }
        return URLComponents(url: mainDocumentURL, resolvingAgainstBaseURL: false)
    }

    var cachePolicy: URLRequest.CachePolicy {
        return URLRequest.CachePolicy(rawValue: rawCachePolicy)!
    }

    var networkServiceType: URLRequest.NetworkServiceType {
        return URLRequest.NetworkServiceType(rawValue: rawNetworkServiceType)!
    }

    @available(iOS 15, *)
    var attribution: URLRequest.Attribution {
        return URLRequest.Attribution(rawValue: rawAttribution)!
    }

    var timeoutInterval: TimeInterval {
        return TimeInterval(rawTimeoutInterval)
    }
}

// MARK: Functional Extension

extension NetworkRequestEntity {
    static func description(networkHeaderEntity: NSEntityDescription) -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "rawURL", attributeType: .URIAttributeType),
            NSAttributeDescription(name: "rawHTTPMethod", attributeType: .stringAttributeType),
            NSAttributeDescription(name: "rawHTTPBody", attributeType: .binaryDataAttributeType, isOptional: true),
            NSAttributeDescription(name: "rawHTTPBodySize", attributeType: .integer64AttributeType),
            NSRelationshipDescription(name: "rawHTTPHeaders", relationshipType: .oneToMany, entityDescription: networkHeaderEntity),
            NSAttributeDescription(name: "rawMainDocumentURL", attributeType: .URIAttributeType, isOptional: true),
            NSAttributeDescription(name: "rawCachePolicy", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawNetworkServiceType", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawAttribution", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawTimeoutInterval", attributeType: .doubleAttributeType),
            NSAttributeDescription(name: "allowsCellularAccess", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "allowsConstrainedNetworkAccess", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "allowsExpensiveNetworkAccess", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "assumesHTTP3Capable", attributeType: .booleanAttributeType)
        ]

        return entityDescription
    }
}
