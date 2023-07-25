//
//  DurationFormatter.swift
//  DSModel
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

import Foundation

// MARK: DurationFormatter

public enum DurationFormatter {
    public static func string(from timeInterval: TimeInterval, isPrecise: Bool) -> String {
        guard timeInterval >= 0.95 else {
            return String(format: "%.\(isPrecise ? "1" : "0")f ms", timeInterval * 1000)
        }

        guard timeInterval >= 200 else {
            return String(format: "%.\(isPrecise ? "3" : "1")f s", timeInterval)
        }

        let minutes = timeInterval / 60

        guard minutes >= 60 else {
            return String(format: "%.1f min", minutes)
        }

        let hours = timeInterval / (60 * 60)

        return String(format: "%.1f h", hours)
    }

    public static func string(from timeInterval: TimeInterval) -> String {
        return string(from: timeInterval, isPrecise: true)
    }
}

// static func string(from timeInterval: TimeInterval, isPrecise: Bool) -> String {
//    if timeInterval < 0.95 {
//        if isPrecise {
//            return String(format: "%.1f ms", timeInterval * 1000)
//        } else {
//            return String(format: "%.0f ms", timeInterval * 1000)
//        }
//    }
//
//    if timeInterval < 200 {
//        return String(format: "%.\(isPrecise ? "3" : "1")f s", timeInterval)
//    }
//
//    let minutes = timeInterval / 60
//
//    if minutes < 60 {
//        return String(format: "%.1f min", minutes)
//    }
//
//    let hours = timeInterval / (60 * 60)
//
//    return String(format: "%.1f h", hours)
// }
