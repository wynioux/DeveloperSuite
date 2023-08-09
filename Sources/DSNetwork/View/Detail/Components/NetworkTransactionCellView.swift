//
//  NetworkTransactionCellView.swift
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

import DSModel
import DSPersistence
import SwiftUI

// MARK: View

@available(iOS 15, *)
struct NetworkTransactionCellView: View {
    @ObservedObject var entity: NetworkTransactionMetricsEntity

    var body: some View {
        let transactionGraphDatas: [TransactionGraphData] = createTransactionGraphDatas(from: entity)

        let totalDuration = transactionGraphDatas
            .lazy
            .map { $0.duration }
            .reduce(0.0, +)

        VStack {
            Text(entity.resourceFetchType.description)
                .fixedSize()
                .badge(DurationFormatter.string(from: TimeInterval(totalDuration)))

            VStack {
                GeometryReader { proxy in
                    HStack(spacing: 0) {
                        ForEach(transactionGraphDatas.sorted(), id: \.self) { data in
                            Rectangle()
                                .fill(data.type.color)
                                .frame(width: proxy.size.width / (totalDuration / data.duration))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .frame(height: 10)

                HStack(spacing: 7) {
                    ForEach(transactionGraphDatas.sorted(), id: \.self) { data in
                        HStack(spacing: 4) {
                            Circle()
                                .fill(data.type.color)
                                .frame(height: 5)

                            Text(data.type.title)
                                .fixedSize()
                        }
                        .font(.caption2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

// MARK: Preview

@available(iOS 15, *)
struct NetworkTransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkTransactionCellView(entity: NetworkTransactionMetricsEntity())
    }
}

// MARK: Extension

@available(iOS 15, *)
extension NetworkTransactionCellView {
    func createTransactionGraphDatas(from transaction: NetworkTransactionMetricsEntity) -> [TransactionGraphData] {
        var datas: [TransactionGraphData] = []

        if let start = transaction.fetchStartDate {
            if let end = transaction.domainLookupStartDate {
                datas.append(.init(type: .queue, duration: end.timeIntervalSince(start)))
            } else if let end = transaction.requestStartDate {
                datas.append(.init(type: .queue, duration: end.timeIntervalSince(start)))
            }
        }

        if let start = transaction.domainLookupStartDate,
           let end = transaction.domainLookupEndDate
        {
            datas.append(.init(type: .dns, duration: end.timeIntervalSince(start)))
        }

        if let start = transaction.secureConnectionStartDate,
           let end = transaction.secureConnectionEndDate
        {
            datas.append(.init(type: .tls, duration: end.timeIntervalSince(start)))
        }

        if let start = transaction.connectStartDate,
           let end = transaction.connectEndDate
        {
            let tls = datas.first(where: { $0.type == .tls })

            datas.append(.init(type: .tcp, duration: end.timeIntervalSince(start) - (tls?.duration ?? 0)))
        }

        if let start = transaction.requestStartDate,
           let end = transaction.requestEndDate
        {
            datas.append(.init(type: .request, duration: end.timeIntervalSince(start)))
        }

        if let start = transaction.responseStartDate,
           let end = transaction.responseEndDate
        {
            datas.append(.init(type: .response, duration: end.timeIntervalSince(start)))
        }

        return datas
    }
}
