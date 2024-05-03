//
//  Structures.swift
//  tbc-IsDavaleba-RomelicDzalianMovindome
//
//  Created by Giorgi Michitashvili on 5/3/24.
//

import Foundation
import UIKit
 

struct Fact: Codable {
    let fact: String?
    let length: Int?
}

struct CatFact: Decodable {
    var data: [Fact]
}

enum FactError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
