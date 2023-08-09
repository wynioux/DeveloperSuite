//
//  PersistentStore+Model.swift
//  DSPersistence
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

// MARK: ManagedObjectModel

extension PersistentStore {
    static var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel()

        // MARK: DeeplinkEntity

        let deeplinkEntity: NSEntityDescription = DeeplinkEntity.description()

        managedObjectModel.entities.append(deeplinkEntity)

        // MARK: LogEntity

        let logEntity: NSEntityDescription = LogEntity.description()

        managedObjectModel.entities.append(logEntity)

        // MARK: NetworkHeaderEntity

        let networkHeaderEntity: NSEntityDescription = NetworkHeaderEntity.description()

        managedObjectModel.entities.append(networkHeaderEntity)

        // MARK: NetworkRequestEntity

        let networkRequestEntity: NSEntityDescription = NetworkRequestEntity.description(networkHeaderEntity: networkHeaderEntity)

        managedObjectModel.entities.append(networkRequestEntity)

        // MARK: NetworkResponseEntity

        let networkResponseEntity: NSEntityDescription = NetworkResponseEntity.description(networkHeaderEntity: networkHeaderEntity)

        managedObjectModel.entities.append(networkResponseEntity)

        // NetworkTransactionMetricsEntity

        let networkTransactionMetricsEntity: NSEntityDescription = NetworkTransactionMetricsEntity.description()
        
        managedObjectModel.entities.append(networkTransactionMetricsEntity)

        // MARK: NetworkMetricsEntity

        let networkMetricsEntity: NSEntityDescription = NetworkMetricsEntity.description(networkTransactionMetricsEntity: networkTransactionMetricsEntity)

        managedObjectModel.entities.append(networkMetricsEntity)

        // MARK: NetworkErrorEntity

        let networkErrorEntity: NSEntityDescription = NetworkErrorEntity.description()

        managedObjectModel.entities.append(networkErrorEntity)

        // MARK: NetworkEntity

        let networkEntity: NSEntityDescription = NetworkEntity.description(networkRequestEntity: networkRequestEntity,
                                                                           networkResponseEntity: networkResponseEntity,
                                                                           networkMetricsEntity: networkMetricsEntity,
                                                                           networkErrorEntity: networkErrorEntity)

        managedObjectModel.entities.append(networkEntity)

        return managedObjectModel
    }()
}
