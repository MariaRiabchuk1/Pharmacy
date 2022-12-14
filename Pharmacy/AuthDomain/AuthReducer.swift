//
//  AuthReducer.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import ComposableArchitecture
import FirebaseAuth
import SwiftUI

public typealias AuthReducer = ComposableArchitecture.Reducer<AuthState, AuthAction, AuthEnvironment>

public let authReducer = AuthReducer.combine(
    
    Reducer { state, action, environment in
        switch action {
        case .initialize:
            return .none
        case .logInButtonTapped:
            let email = state.emailQuery
            let password = state.passwordQuery
            return .task {
                do {
                    let user = try await AuthService().logIn(email: "admin@admin.com", password: "admin1")
                    return .successLogedIn(user)
                } catch {
                    return .failedLogedIn
                }
            }
        case .successLogedIn(let user):
            state.isUserValid = true
            return .task {
                // TODO: OR | DI
                let manager = APIManager()
                let user = try await manager.getCurrentUser()
                return .setCurrentUser(user)
            }
        case .setCurrentUser(let user):
            state.dashboardState.currentUser = user
            return .none
        case .dismiss(let isValid):
            return .none
        case .dashboardAction(_):
            return .none
        case .emailQueryChanged(let query):
            state.emailQuery = query
            return .none
        case .passwordQueryChanged(let query):
            state.passwordQuery = query
            return .none
        case .failedLogedIn:
            state.alert = AlertState(title: .init("Wrong user"), message: .init("Wrong user"), dismissButton: .default(.init("Cancel"), send: .alertConfirmTapped))
            
            return .none
        case .alertConfirmTapped:
            state.alert = nil
            return .none
        }
    },
    
    reducer
        .pullback(state: \.dashboardState,
                  action: /AuthAction.dashboardAction,
                  environment: {
                      .init(mainQueue: $0.mainQueue, apiManager: $0.apiManager)
                  })
).debug()
