//
//  PersistentStore.swift
//  Persistence
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

// MARK: PersistentStore

public final class PersistentStore: ObservableObject {
    // MARK: Properties

    public static let live = PersistentStore()
    public static let preview = PersistentStore(inMemory: true)

    private let queue = DispatchQueue(label: "io.github.wynioux.DeveloperSuite.PersistentStore")
    private let savingInterval: DispatchTimeInterval = .milliseconds(250)
    private var savingScheduled: Bool = false

    private let container: NSPersistentContainer

    let backgroundContext: NSManagedObjectContext

    public var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    // MARK: Initializer

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DeveloperSuite", managedObjectModel: Self.managedObjectModel)

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            print("Persistent stores loaded successfully: \(description)")

            guard let error else { return }

            print("An error occured while loading persistent stores: \(error)")
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

        backgroundContext = container.newBackgroundContext()
        backgroundContext.automaticallyMergesChangesFromParent = true
    }

    private func _save() {
        backgroundContext.perform { [weak self] in
            guard let self else { return }

            do {
                try backgroundContext.save()
            } catch {
                print(error)
            }

            backgroundContext.reset()
        }
    }

    func save() {
        guard backgroundContext.hasChanges,
              !savingScheduled
        else { return }

        savingScheduled = true

        queue.asyncAfter(deadline: .now() + savingInterval) { [weak self] in
            guard let self else { return }

            _save()

            savingScheduled = false
        }
    }

    public func perform(context: @escaping (NSManagedObjectContext) -> Void) {
        backgroundContext.perform {
            context(self.backgroundContext)
            self.save()
        }
    }

    public func first<T: IdentifiableEntity>(_ t: T.Type, by id: UUID) throws -> T? {
        return try? backgroundContext.first(T.self) {
            $0.predicate = NSPredicate(format: "id == %@", id as NSUUID)
        }
    }
}
