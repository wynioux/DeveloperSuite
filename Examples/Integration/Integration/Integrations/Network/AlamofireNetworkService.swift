//
//  AlamofireNetworkService.swift
//  Integration
//
//  Created by Bahadır A. Güder on 25.07.2023.
//

import Alamofire
import DeveloperSuite
import Foundation

final class AlamofireNetworkService {
    let session = Session(eventMonitors: [DeveloperSuiteEventMonitor()])

    func performRequest<T: Decodable>(url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        session
            .request(url)
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.result.mapError { $0 })
            }
    }
}

final class DeveloperSuiteEventMonitor: EventMonitor {
    let networkLogger = NetworkLogger.default
    
    init() {
        networkLogger.configure { configuration in
            configuration.label = "Alamofire"
        }
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let task = request.task else { return }
        networkLogger.log(task, didFinishDecodingWithError: response.error?.underlyingError)
    }
}
