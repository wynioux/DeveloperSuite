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
                Text(Image(systemName: entity.state.systemImageName))
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
    }

    var middleSection: some View {
        VStack {
            Text(entity.originalRequest.urlComponents?.url?.description ?? "")
                .font(.body)
                .foregroundColor(Color(.label))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var bottomSection: some View {
        HStack {
            Text(entity.currentRequest.httpMethod.rawValue)
                .fontWeight(.medium)

            Spacer()

            Text("\(Image(systemName: "arrow.up")) \(ByteCountFormatter.cell.string(fromByteCount: Int64(entity.originalRequest.rawHTTPBodySize)))")

            Text("\(Image(systemName: "arrow.down")) \(ByteCountFormatter.cell.string(fromByteCount: entity.response?.expectedContentLength ?? 0))")

            Text("\(Image(systemName: "clock")) \(DurationFormatter.string(from: TimeInterval(entity.metrics?.duration ?? 0), isPrecise: false))")
        }
        .font(.footnote)
        .foregroundColor(Color(.secondaryLabel))
    }
}
