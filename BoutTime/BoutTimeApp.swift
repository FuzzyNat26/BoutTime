//
//  BoutTimeApp.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

@main
struct BoutTimeApp: App {
    @AppStorage("firstTimeOpenTheApp") var firstTimeOpenTheApp: Bool = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistenceController = PersistenceController.shared
    
    init() {
        requestNotifications()
    }
    
    func requestNotifications() {
        //TODO: Step 1 - Authorization
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if granted {
                print("All SET!!!")
            } else if let error = error {
                print(error.localizedDescription)
            }
            
            // Enable or disable features based on the authorization.
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                PrioritiesScreen()
                    .tabItem {
                        Label("Prioritas", systemImage: "list.bullet")
                    }.environment(\.managedObjectContext, persistenceController.container.viewContext)
                PointScreen()
                    .tabItem {
                        Label("Poin", systemImage: "checkmark.seal.fill")
                    }.environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environmentObject(LevelObserver())
            .fullScreenCover(
                isPresented: $firstTimeOpenTheApp,
                onDismiss: {UserDefaults.standard.set(false, forKey: "firstTimeOpenTheApp")}
            ) {
                WelcomeScreen()
            }
        }
    }
}
