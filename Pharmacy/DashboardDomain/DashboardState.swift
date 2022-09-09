//
//  StateDashboard.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 05.09.2022.
//

import Foundation

public struct DashboardState: Equatable {
    
    // MARK: - Properties
    
    public var selectedCell: String = ""
    public var drugs: [Drugs] = []
    
    public var isWebApplicationActive = false
    public var isStorageActive = false

    // MARK: States

    public var webApplicationState = WebApplicationState()
    public var storageState = StorageState()
    
    public init() {}
}
