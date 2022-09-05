//
//  PharmacyApp.swift
//  Pharmacy
//
//  Created by Marichka on 04.09.2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct PharmacyApp: App {
    
    let store = ComposableArchitecture.Store(
        initialState: StateDashboard(),
        reducer: reducer,
        environment: EnvironmentDashboard(
            mainQueue: .main
        )
    )

    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                DashboardViewDomain(store: store)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationViewStyle(.stack)
            
        }
    }
}
