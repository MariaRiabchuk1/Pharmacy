//
//  ActionsDashboard.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 05.09.2022.
//

import Foundation
import ComposableArchitecture

public enum DashboardAction: Equatable {
    
    case initialize
    case dismiss(Bool)
    
    // MARK: User interaction
    
    case medicsButtonTapped
    case googleButtonTapped
    case gmailButtonTapped
    case storageButtonTapped
    case drugsButtonTapped
    
    case webApplicationAction(WebApplicationAction)
    
}
