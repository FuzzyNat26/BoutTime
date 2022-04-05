//
//  BoutTimeApp.swift
//  BoutTime
//
//  Created by Jonathan Lee on 04/04/22.
//

import SwiftUI

@main
struct BoutTimeApp: App {
    let persistenceController = PersistenceController.shared
    
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
                    }
            }
        }
    }
}
