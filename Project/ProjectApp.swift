//
//  ProjectApp.swift
//  Project
//
//  Created by Olamitide Akomolafe on 2024-02-11.
//

import SwiftUI
import SwiftData

@main
struct ProjectApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            SplashView()
            
        }
//        .modelContainer(sharedModelContainer)
    }
}
