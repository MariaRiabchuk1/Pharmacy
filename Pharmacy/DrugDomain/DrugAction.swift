//
//  DrugAction.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public enum DrugAction: Equatable {
    
    case initialize
    case openDetail
    case dismiss(Bool)
    case save
    
    case incrButtonTapped(Departments)
    case decrButtonTapped(Departments)
    
    // MARK: User interaction
    
}
