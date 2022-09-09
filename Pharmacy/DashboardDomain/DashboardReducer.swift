//
//  ReducerDashboard.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 05.09.2022.
//

import ComposableArchitecture
import SwiftUI

public typealias DashboardReducer = ComposableArchitecture.Reducer<DashboardState, DashboardAction, DashboardEnvironment>

public let reducer = DashboardReducer.combine(
    Reducer { state, action, environment in
        switch action {
        case .initialize:
            return .none
        case .medicsButtonTapped:
            state.selectedCell = "Medics selected"
            return .none
        case .googleButtonTapped:
            state.selectedCell = "Google selected"
            return .none
        case .gmailButtonTapped:
            state.selectedCell = "Gmail selected"
            return .none
        case .storageButtonTapped:
            state.selectedCell = "Storage selected"
            return .none
        case .drugsButtonTapped:
            state.selectedCell = "drugs selected"
            return .none
        }
    }
).debug()
