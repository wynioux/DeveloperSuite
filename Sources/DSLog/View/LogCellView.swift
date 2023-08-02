//
//  LogCellView.swift
//  DSLog
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
struct LogCellView: View {
    @ObservedObject var entity: LogEntity

    var body: some View {
        VStack(spacing: 5) {
            topSection
            middleSection
            bottomSection
        }
    }
}

@available(iOS 15, *)
extension LogCellView {
    var topSection: some View {
        HStack(spacing: 0) {
            HStack(spacing: 4) {
                Text(Image(systemName: "circlebadge.fill"))
                    .font(.footnote)

                Text(entity.level.rawValue)
                    .font(.callout)
                    .fontWeight(.medium)
                    .lineLimit(1)
            }
            .foregroundColor(entity.level.color)

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
            Text(entity.message)
                .font(.body)
                .foregroundColor(Color(.label))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var bottomSection: some View {
        Text(entity.label)
            .font(.footnote)
            .foregroundColor(Color(.secondaryLabel))
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
