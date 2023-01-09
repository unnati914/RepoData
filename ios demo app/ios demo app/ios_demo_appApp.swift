//
//  ios_demo_appApp.swift
//  ios demo app
//
//  Created by Unnati on 20/10/1944 Saka.
//

import SwiftUI

@main
struct ios_demo_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
