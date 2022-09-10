//
//  AuthState.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation
import ComposableArchitecture

public struct AuthState: Equatable {
    
    // MARK: - Properties
    
    public var isUserValid = false
    
    public var emailQuery = ""
    public var passwordQuery = ""
    
    public var alert: AlertState<AuthAction>?
    
    // MARK: States
    
    public var dashboardState = DashboardState()
    
    public init() {}
}
