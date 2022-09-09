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
        case .dismiss(let isActive):
            state.isWebApplicationActive = isActive
            return .none
        case .medicsButtonTapped:
            guard let url = URL(string: "https://medics.ua") else { return .none }
            state.webApplicationState.currentURL = url
            state.isWebApplicationActive = true
            return .none
        case .googleButtonTapped:
            guard let url = URL(string: "https://google.com") else { return .none }
            state.webApplicationState.currentURL = url
            state.isWebApplicationActive = true
            return .none
        case .gmailButtonTapped:
            guard let url = URL(string: "https://www.knp-rakhiv-rl.com.ua") else { return .none }
            state.webApplicationState.currentURL = url
            state.isWebApplicationActive = true
            return .none
        case .storageButtonTapped:
            return .none
        case .drugsButtonTapped:
            return .none
        case .webApplicationAction(let action):
            return .none
        }
    },
    
    webApplicationReducer
        .pullback(state: \.webApplicationState,
                  action: /DashboardAction.webApplicationAction,
                  environment: {
                      .init(mainQueue: $0.mainQueue)
                  })
    
).debug()
