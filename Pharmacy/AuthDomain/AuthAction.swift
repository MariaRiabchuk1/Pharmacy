//
//  AuthAction.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation
import FirebaseAuth
import ComposableArchitecture

public enum AuthAction: Equatable {    
    case initialize
    
    case dismiss(Bool)
    
    case logInButtonTapped
    case emailQueryChanged(String)
    case passwordQueryChanged(String)
    
    case setCurrentUser(MedicalUser?)
    
    // States
    case alertConfirmTapped
    
    case dashboardAction(DashboardAction)
    
    case successLogedIn(User)
    case failedLogedIn
    
}
