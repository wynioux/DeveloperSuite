//
//  LogRepository.swift
//  DeveloperSuiteLogging
//
//  Created by Bahadır A. Güder on 21.08.2023.
//

import ComposableArchitecture
import CoreData
import UIKit

// MARK: PersistentRepository

final class PersistentRepository {
    private let container: NSPersistentContainer
    private let delegate = FetchedResultsControllerDelegate()
    private var resultsController: NSFetchedResultsController<NSManagedObject>?

    let readContext: NSManagedObjectContext
    let writeContext: NSManagedObjectContext

    init(inMemory: Bool = false) {
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

        readContext = container.viewContext
        writeContext = container.newBackgroundContext()
    }

    func createResultsController(entityName: String, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.fetchBatchSize = 100

        resultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: readContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        resultsController?.delegate = delegate

        do {
            try resultsController?.performFetch()
        } catch {
            print(error)
        }
    }

    func retriveInitialObjects() -> [NSManagedObject]? {
        return resultsController?.fetchedObjects
    }

    func controllerDidChangeContent() -> AsyncStream<NSFetchedResultsController<NSFetchRequestResult>> {
        return AsyncStream<NSFetchedResultsController<NSFetchRequestResult>> { continuation in
            self.delegate.controllerDidChangeContentContinuation = continuation
        }
    }

    static let managedObjectModel: NSManagedObjectModel = {
        let model = NSManagedObjectModel()

        let logEntity = LogEntity.makeEntityDescription()

        model.entities.append(logEntity)

        return model
    }()
}

// MARK: Delegate

extension PersistentRepository {
    final class FetchedResultsControllerDelegate: NSObject, NSFetchedResultsControllerDelegate {
        var controllerDidChangeContentContinuation: AsyncStream<NSFetchedResultsController<NSFetchRequestResult>>.Continuation?

        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            controllerDidChangeContentContinuation?.yield(controller)
        }
    }
}

// MARK: DependencyKey

extension PersistentRepository: DependencyKey {
    static var liveValue = PersistentRepository(inMemory: true)
    static var previewValue = PersistentRepository(inMemory: true)
    static var testValue = PersistentRepository(inMemory: true)
}

// MARK: DependencyValues

extension DependencyValues {
    var persistentRepository: PersistentRepository {
        get { self[PersistentRepository.self] }
        set { self[PersistentRepository.self] = newValue }
    }
}
