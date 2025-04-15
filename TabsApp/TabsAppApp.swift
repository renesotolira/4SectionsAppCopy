//
//  TabsAppApp.swift
//  TabsApp
//
//  Created by rene on 10/01/25.
//

import SwiftUI
import OneSignalFramework

@main
struct TabsAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
    
    var body: some Scene {
        WindowGroup {
            //SignUpView()
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
       // Enable verbose logging for debugging (remove in production)
       OneSignal.Debug.setLogLevel(.LL_VERBOSE)
       // Initialize with your OneSignal App ID
       OneSignal.initialize("35c47ca5-7ae1-4a4f-a61b-8aa02e268d90", withLaunchOptions: launchOptions)
       // Use this method to prompt for push notifications.
       // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
       OneSignal.Notifications.requestPermission({ accepted in
         print("User accepted notifications: \(accepted)")
       }, fallbackToSettings: false)
      
       return true
    }
}
