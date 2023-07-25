//
//  NSRelationshipDescription+Convenience.swift
//  Extension
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

// MARK: Convenience

public extension NSRelationshipDescription {
    convenience init(name: String, relationshipType: RelationshipType, deleteRule: NSDeleteRule = .cascadeDeleteRule, entityDescription: NSEntityDescription) {
        self.init()
        self.name = name
        self.deleteRule = deleteRule
        self.destinationEntity = entityDescription

        switch relationshipType {
        case .oneToOne(let isOptional):
            switch isOptional {
            case true:
                self.minCount = 0
            case false:
                self.minCount = 1
            }
            self.maxCount = 1

        case .oneToMany:
            self.minCount = 0
            self.maxCount = 0
        }
    }
}
