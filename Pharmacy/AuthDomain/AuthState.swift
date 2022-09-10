//
//  AuthState.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public struct AuthState: Equatable {
    
    // MARK: - Properties
    
    public var isUserValid = false
    
    public var emailQuery = ""
    public var passwordQuery = ""
    
    // MARK: States
    
    public var dashboardState = DashboardState()
    
    public init() {}
}
