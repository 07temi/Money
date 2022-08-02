//
//  MoneyApp.swift
//  Money
//
//  Created by Артем Черненко on 02.08.2022.
//

import SwiftUI

@main
struct MoneyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
