//
//  FailureDecodable.swift
//  Integration
//
//  Created by Bahadır A. Güder on 25.07.2023.
//

import Foundation

struct FailureDecodable: Decodable {
    let url: String
    let origin: Int
}
