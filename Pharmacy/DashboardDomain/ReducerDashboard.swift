//
//  ReducerDashboard.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 05.09.2022.
//

import ComposableArchitecture

public typealias ReducerDashboard = ComposableArchitecture.Reducer<StateDashboard, ActionDashboard, EnvironmentDashboard>

public let reducer = ReducerDashboard.combine(
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
        }
    }
).debug()
