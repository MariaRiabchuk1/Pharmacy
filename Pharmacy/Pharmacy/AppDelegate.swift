//
//  AppDelegate.swift
//  Pharmacy
//
//  Created by Marichka on 08.09.2022.
//

import SwiftUI
import ComposableArchitecture
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
#if DEBUG
        let filePath = Bundle.main.path(forResource: "GoogleService-Info_TEST", ofType: "plist")!
#else
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-PROD", ofType: "plist")!
#endif
        let options = FirebaseOptions(contentsOfFile: filePath)
        FirebaseApp.configure(options: options!)
        
        return true
    }
}
