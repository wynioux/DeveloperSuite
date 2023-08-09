//
//  NetworkTransactionDetailView.swift
//  DSNetwork
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

import DSPersistence
import SwiftUI

// MARK: View

@available(iOS 15, *)
struct NetworkTransactionDetailView: View {
    @ObservedObject var entity: NetworkTransactionMetricsEntity

    var body: some View {
        List {
            if entity.localAddress != nil || entity.remoteAddress != nil {
                Section("ADDRESS") {
                    if let localAddress = entity.localAddress {
                        Text("Local")
                            .fixedSize()
                            .badge(
                                Text("\(localAddress)\(entity.localPort > 0 ? ":\(entity.localPort)" : "")")
                                    .font(.system(.footnote, design: .monospaced))
                            )
                    }
                
                    if let remoteAddress = entity.remoteAddress {
                        Text("Remote")
                            .fixedSize()
                            .badge(
                                Text("\(remoteAddress)\(entity.remotePort > 0 ? ":\(entity.remotePort)" : "")")
                                    .font(.system(.footnote, design: .monospaced))
                            )
                    }
                }
            }
            
            Section("REQUEST") {
                Text("Header")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfRequestHeaderBytesSent))
                
                Text("Body")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfRequestBodyBytesSent))
                
                Text("Body Before Encoding")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfRequestBodyBytesBeforeEncoding))
            }
            
            Section("RESPONSE") {
                Text("Header")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfResponseHeaderBytesReceived))
                
                Text("Body")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfResponseBodyBytesReceived))
                
                Text("Body After Decoding")
                    .fixedSize()
                    .badge(ByteCountFormatter.cell.string(fromByteCount: entity.countOfResponseBodyBytesAfterDecoding))
            }
            
            Section("CHARACTERISTICS") {
                Text("Proxy Connection")
                    .fixedSize()
                    .badge(entity.isProxyConnection ? "True" : "False")
                
                Text("Reused Connection")
                    .fixedSize()
                    .badge(entity.isReusedConnection ? "True" : "False")
                
                Text("Cellular")
                    .fixedSize()
                    .badge(entity.isCellular ? "True" : "False")
                
                Text("Expensive")
                    .fixedSize()
                    .badge(entity.isExpensive ? "True" : "False")
                
                Text("Constrained")
                    .fixedSize()
                    .badge(entity.isConstrained ? "True" : "False")
                
                Text("Multipath")
                    .fixedSize()
                    .badge(entity.isMultipath ? "True" : "False")
            }
            
            Section("SPECIFICATIONS") {
                if let networkProtocolName = entity.networkProtocolName {
                    Text("Network Protocol Name")
                        .fixedSize()
                        .badge(
                            Text(networkProtocolName)
                                .font(.system(.footnote, design: .monospaced))
                        )
                }
                
                Text("Domain Resolution Protocol")
                    .fixedSize()
                    .badge(
                        Text(entity.domainResolutionProtocol.description)
                            .font(.system(.footnote, design: .monospaced))
                    )
                
                if let negotiatedTLSProtocolVersion = entity.negotiatedTLSProtocolVersion {
                    Text("TLS Protocol Version")
                        .fixedSize()
                        .badge(
                            Text(negotiatedTLSProtocolVersion.description)
                                .font(.system(.footnote, design: .monospaced))
                        )
                }
                
                if let negotiatedTLSCipherSuite = entity.negotiatedTLSCipherSuite {
                    Text("TLS Cipher Suite")
                        .fixedSize()
                        .badge(
                            Text(negotiatedTLSCipherSuite.description)
                                .font(.system(.footnote, design: .monospaced))
                        )
                }
            }
        }
        .navigationTitle(entity.resourceFetchType.description)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: Preview

@available(iOS 15, *)
struct NetworkTransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkTransactionDetailView(entity: NetworkTransactionMetricsEntity())
    }
}
