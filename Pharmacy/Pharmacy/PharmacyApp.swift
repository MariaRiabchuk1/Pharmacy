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
    
    var body: some Scene {
        WindowGroup {
                AuthDomainView(store: ComposableArchitecture.Store(
                    initialState: AuthState(),
                    reducer: authReducer,
                    environment: .init(
                        mainQueue: .main
                    )
                ))
                .onAppear {
                    
                }
        }
    }
    
}
