//
//  NetworkTransactionMetricsEntity.swift
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

// MARK: NetworkTransactionMetricsEntity

public final class NetworkTransactionMetricsEntity: NSManagedObject {
    // MARK: Properties

    @NSManaged public var fetchStartDate: Date?
    @NSManaged public var domainLookupStartDate: Date?
    @NSManaged public var domainLookupEndDate: Date?
    @NSManaged public var connectStartDate: Date?
    @NSManaged public var secureConnectionStartDate: Date?
    @NSManaged public var secureConnectionEndDate: Date?
    @NSManaged public var connectEndDate: Date?
    @NSManaged public var requestStartDate: Date?
    @NSManaged public var requestEndDate: Date?
    @NSManaged public var responseStartDate: Date?
    @NSManaged public var responseEndDate: Date?
    @NSManaged public var networkProtocolName: String?
    @NSManaged public var isProxyConnection: Bool
    @NSManaged public var isReusedConnection: Bool
    @NSManaged public var rawResourceFetchType: Int
    @NSManaged public var countOfRequestHeaderBytesSent: Int64
    @NSManaged public var countOfRequestBodyBytesSent: Int64
    @NSManaged public var countOfRequestBodyBytesBeforeEncoding: Int64
    @NSManaged public var countOfResponseHeaderBytesReceived: Int64
    @NSManaged public var countOfResponseBodyBytesReceived: Int64
    @NSManaged public var countOfResponseBodyBytesAfterDecoding: Int64
    @NSManaged public var localAddress: String?
    @NSManaged public var remoteAddress: String?
    @NSManaged public var isCellular: Bool
    @NSManaged public var isExpensive: Bool
    @NSManaged public var isConstrained: Bool
    @NSManaged public var isMultipath: Bool
    @NSManaged public var rawDomainResolutionProtocol: Int
    @NSManaged public var localPort: Int
    @NSManaged public var remotePort: Int
    @NSManaged public var rawNegotiatedTLSProtocolVersion: Int
    @NSManaged public var rawNegotiatedTLSCipherSuite: Int

    // MARK: Convenience Initializer

    public convenience init(context: NSManagedObjectContext, transactionMetrics: URLSessionTaskTransactionMetrics) {
        self.init(context: context)

        self.fetchStartDate = transactionMetrics.fetchStartDate
        self.domainLookupStartDate = transactionMetrics.domainLookupStartDate
        self.domainLookupEndDate = transactionMetrics.domainLookupEndDate
        self.connectStartDate = transactionMetrics.connectStartDate
        self.secureConnectionStartDate = transactionMetrics.secureConnectionStartDate
        self.secureConnectionEndDate = transactionMetrics.secureConnectionEndDate
        self.connectEndDate = transactionMetrics.connectEndDate
        self.requestStartDate = transactionMetrics.requestStartDate
        self.requestEndDate = transactionMetrics.requestEndDate
        self.responseStartDate = transactionMetrics.responseStartDate
        self.responseEndDate = transactionMetrics.responseEndDate
        self.networkProtocolName = transactionMetrics.networkProtocolName
        self.isProxyConnection = transactionMetrics.isProxyConnection
        self.isReusedConnection = transactionMetrics.isReusedConnection
        self.rawResourceFetchType = transactionMetrics.resourceFetchType.rawValue
        self.countOfRequestHeaderBytesSent = transactionMetrics.countOfRequestHeaderBytesSent
        self.countOfRequestBodyBytesSent = transactionMetrics.countOfRequestBodyBytesSent
        self.countOfRequestBodyBytesBeforeEncoding = transactionMetrics.countOfRequestBodyBytesBeforeEncoding
        self.countOfResponseHeaderBytesReceived = transactionMetrics.countOfResponseHeaderBytesReceived
        self.countOfResponseBodyBytesReceived = transactionMetrics.countOfResponseBodyBytesReceived
        self.countOfResponseBodyBytesAfterDecoding = transactionMetrics.countOfResponseBodyBytesAfterDecoding
        self.localAddress = transactionMetrics.localAddress
        self.remoteAddress = transactionMetrics.remoteAddress
        self.isCellular = transactionMetrics.isCellular
        self.isExpensive = transactionMetrics.isExpensive
        self.isConstrained = transactionMetrics.isConstrained
        self.isMultipath = transactionMetrics.isMultipath
        self.rawDomainResolutionProtocol = transactionMetrics.domainResolutionProtocol.rawValue
        self.localPort = transactionMetrics.localPort ?? 0
        self.remotePort = transactionMetrics.remotePort ?? 0
        self.rawNegotiatedTLSProtocolVersion = Int(transactionMetrics.negotiatedTLSProtocolVersion?.rawValue ?? 0)
        self.rawNegotiatedTLSCipherSuite = Int(transactionMetrics.negotiatedTLSCipherSuite?.rawValue ?? 0)
    }
}

// MARK: Property Extension

public extension NetworkTransactionMetricsEntity {
    var resourceFetchType: URLSessionTaskMetrics.ResourceFetchType {
        return .init(rawValue: rawResourceFetchType) ?? .unknown
    }

    var domainResolutionProtocol: URLSessionTaskMetrics.DomainResolutionProtocol {
        return .init(rawValue: rawDomainResolutionProtocol) ?? .unknown
    }

    var negotiatedTLSProtocolVersion: tls_protocol_version_t? {
        return .init(rawValue: UInt16(rawNegotiatedTLSProtocolVersion))
    }

    var negotiatedTLSCipherSuite: tls_ciphersuite_t? {
        return .init(rawValue: UInt16(rawNegotiatedTLSCipherSuite))
    }
}

// MARK: Functional Extension

extension NetworkTransactionMetricsEntity {
    static func description() -> NSEntityDescription {
        let entityDescription: NSEntityDescription = .init(for: Self.self)

        entityDescription.properties = [
            NSAttributeDescription(name: "fetchStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "domainLookupStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "domainLookupEndDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "connectStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "secureConnectionStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "secureConnectionEndDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "connectEndDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "requestStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "requestEndDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "responseStartDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "responseEndDate", attributeType: .dateAttributeType, isOptional: true),
            NSAttributeDescription(name: "networkProtocolName", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "isProxyConnection", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "isReusedConnection", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "rawResourceFetchType", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfRequestHeaderBytesSent", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfRequestBodyBytesSent", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfRequestBodyBytesBeforeEncoding", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfResponseHeaderBytesReceived", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfResponseBodyBytesReceived", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "countOfResponseBodyBytesAfterDecoding", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "localAddress", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "remoteAddress", attributeType: .stringAttributeType, isOptional: true),
            NSAttributeDescription(name: "isCellular", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "isExpensive", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "isConstrained", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "isMultipath", attributeType: .booleanAttributeType),
            NSAttributeDescription(name: "rawDomainResolutionProtocol", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "localPort", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "remotePort", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawNegotiatedTLSProtocolVersion", attributeType: .integer64AttributeType),
            NSAttributeDescription(name: "rawNegotiatedTLSCipherSuite", attributeType: .integer64AttributeType)
        ]

        return entityDescription
    }
}

// MARK: Identifiable

extension NetworkTransactionMetricsEntity: Identifiable {
    public var id: NSManagedObjectID { return objectID }
}

// MARK: Comparable

extension NetworkTransactionMetricsEntity: Comparable {
    public static func < (lhs: NetworkTransactionMetricsEntity, rhs: NetworkTransactionMetricsEntity) -> Bool {
        guard let lhsDate = lhs.requestStartDate,
              let rhsDate = rhs.requestStartDate
        else { return false }

        return lhsDate < rhsDate
    }
}
