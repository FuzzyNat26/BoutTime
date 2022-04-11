//
//  AppDelegate.swift
//  BoutTime
//
//  Created by Jonathan Lee on 10/04/22.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        //TODO: Additional Step 3
        configureUserNotifications()
        
        return true
    }
}

//TODO: Additional Step 1
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler(.banner)
    }
    
    private func configureUserNotifications() {
        UNUserNotificationCenter.current().delegate = self
    }
}
