//
//  StorageAction.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 09.09.2022.
//

import Foundation
import ComposableArchitecture

public enum StorageAction: Equatable {
    
    case initialize
    case setDrugs([Drugs])
    
    // MARK: User interaction
    
    case searchTextChange(String)
    
    case closeStorage
}
