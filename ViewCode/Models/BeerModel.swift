//
//  BeerModel.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 10/02/21.
//

import Foundation

struct Beer: Codable {
    
    let name: String
    let description: String
    let price: Double
    let volume: String
    let discount: Bool
}

