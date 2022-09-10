//
//  Drugs.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public struct Drugs: Equatable, Hashable {
    let name: String
    let image: String
    let description: String
    let count: Int
    
    public init(name: String, image: String, description: String, count: Int) {
        self.name = name
        self.image = image
        self.description = description
        self.count = count
    }
}
