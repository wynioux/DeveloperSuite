//
//  DynamicFetchRequestView.swift
//  DSUI
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
import DSPersistence
import SwiftUI

// MARK: View

public struct DynamicFetchRequestView<T: IdentifiableEntity, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (FetchedResults<T>) -> Content

    public init(fetchRequest request: NSFetchRequest<T>, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        _fetchRequest = FetchRequest<T>(fetchRequest: request)

        self.content = content
    }

    public init(sortDescriptors: [NSSortDescriptor] = [], predicate: NSPredicate? = nil, animation: Animation? = nil, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        _fetchRequest = FetchRequest(sortDescriptors: sortDescriptors, predicate: predicate, animation: animation)

        self.content = content
    }

    public init(id: UUID, animation: Animation? = nil, @ViewBuilder content: @escaping (FetchedResults<T>) -> Content) {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)
        fetchRequest.sortDescriptors = []
        fetchRequest.fetchLimit = 1

        _fetchRequest = FetchRequest(fetchRequest: fetchRequest, animation: animation)

        self.content = content
    }

    public var body: some View {
        self.content(fetchRequest)
    }
}

// MARK: Preview

// struct DynamicFetchRequestView_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicFetchRequestView()
//    }
// }
