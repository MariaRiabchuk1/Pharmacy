//
//  PharmacyApp.swift
//  Pharmacy
//
//  Created by Marichka on 04.09.2022.
//

import SwiftUI
import ComposableArchitecture
import FirebaseCore


@main
struct PharmacyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let store = ComposableArchitecture.Store(
        initialState: AuthState(),
        reducer: authReducer,
        environment: .init(
            mainQueue: .main
        )
    )

    
    var body: some Scene {
        WindowGroup {
//            NavigationView {
                AuthDomainView(store: store)
//                DashboardViewDomain(store: store)
//            }
//            .navigationBarTitle("", displayMode: .automatic)
//            .navigationBarHidden(true)
//            .navigationViewStyle(.stack)
        }
    }
}
