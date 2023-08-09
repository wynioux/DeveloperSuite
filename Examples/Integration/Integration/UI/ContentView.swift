//
//  ContentView.swift
//  Integration
//
//  Created by Bahadır A. Güder on 25.07.2023.
//

import DeveloperSuite
import SwiftUI

struct ContentView: View {
    let alamofireNetworkService = AlamofireNetworkService()
    let developerSuiteLog = DeveloperSuiteLog.shared
    let swiftLog = SwiftLog.shared

    var body: some View {
        NavigationView {
            List {
                Button("Open DeveloperSuite") {
                    guard let url = URL(string: "integration://suite") else { return }
                    UIApplication.shared.open(url)
                }

                Button("Test Deeplink") {
                    if let url = URL(string: "integration://user/open?name=bahadir") {
                        UIApplication.shared.open(url)
                    }

                    if let url = URL(string: "integration://feature/login?username=foo&password=123456789") {
                        UIApplication.shared.open(url)
                    }
                }

                Button("Test Log") {
                    developerSuiteLog.logger.info("Hello, I am Native DeveloperSuite Logger!")
                    swiftLog.logger.info("Hello, I am SwiftLog Logger!")
                }

                Button("Test Network") {
                    alamofireNetworkService.performRequest(url: "https://google.com", responseType: SuccessDecodable.self) { (result: Result<SuccessDecodable, Error>) in
                        print(result)
                    }
                    
                    alamofireNetworkService.performRequest(url: "https://httpbin.org/get", responseType: SuccessDecodable.self) { (result: Result<SuccessDecodable, Error>) in
                        print(result)
                    }

                    alamofireNetworkService.performRequest(url: "https://httpbin.org/get", responseType: FailureDecodable.self) { (result: Result<FailureDecodable, Error>) in
                        print(result)
                    }
                }
            }
            .navigationTitle("Demo")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
