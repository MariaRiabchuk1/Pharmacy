//
//  StorageState.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 09.09.2022.
//

import Foundation

public struct StorageState: Equatable {
    
    // MARK: - Properties
    
    public var drugsState = [DrugState]()
    public var originDrugsState = [DrugState]()
    
    public var searchText: String = ""
    
    // MARK: States
    
    public init() {}
}
