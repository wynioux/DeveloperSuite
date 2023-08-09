//
//  NetworkCellView.swift
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

struct NetworkCellView: View {
    @ObservedObject var entity: NetworkEntity

    var body: some View {
        VStack(spacing: 5) {
            topSection
            middleSection
            bottomSection
        }
    }
}

extension NetworkCellView {
    func getTopSectionColor(for entity: NetworkEntity) -> Color {
        guard case .success = entity.state,
              let statusCode = entity.response?.statusCode
        else { return entity.state.color }

        return statusCode.color
    }

    var topSection: some View {
        HStack(spacing: 0) {
            HStack(spacing: 4) {
                Image(systemName: entity.state.systemImageName)
                    .font(.footnote)

                Text(entity.state == .success ? (entity.response?.statusCode.title ?? "") : entity.state.description)
                    .font(.callout)
                    .fontWeight(.medium)
                    .lineLimit(1)
            }
            .foregroundColor(getTopSectionColor(for: entity))

            Spacer()

            HStack {
                Text(DateFormatter.cell.string(from: entity.createdAt))
                    .font(.system(.caption, design: .monospaced))
                    .fontWeight(.medium)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
        .animation(.linear(duration: 0.1), value: entity.state)
    }

    var middleSection: some View {
        VStack {
            Text(entity.state == .pending ? (entity.originalRequest.urlComponents?.url?.description ?? "") : (entity.currentRequest.urlComponents?.url?.description ?? ""))
                .font(.body)
                .foregroundColor(Color(.label))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .animation(.linear(duration: 0.1), value: entity.state)
    }

    var bottomSection: some View {
        HStack {
            Text(entity.currentRequest.httpMethod.rawValue)
                .fontWeight(.medium)

            Spacer()

            Text("\(Image(systemName: "arrow.up")) \(ByteCountFormatter.cell.string(fromByteCount: Int64(entity.originalRequest.decompressedHTTPBodySize)))")

            if let decompressedHTTPBodySize = entity.response?.decompressedHTTPBodySize {
                Text("\(Image(systemName: "arrow.down")) \(ByteCountFormatter.cell.string(fromByteCount: Int64(decompressedHTTPBodySize)))")
            }

            if let duration = entity.metrics?.duration {
                Text("\(Image(systemName: "clock")) \(DurationFormatter.string(from: TimeInterval(duration)))")
            }
        }
        .font(.footnote)
        .foregroundColor(Color(.secondaryLabel))
        .animation(.linear(duration: 0.1), value: entity.response)
        .animation(.linear(duration: 0.1), value: entity.metrics)
    }
}
