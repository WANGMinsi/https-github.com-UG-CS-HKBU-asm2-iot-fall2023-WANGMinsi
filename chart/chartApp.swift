//
//  chartApp.swift
//  chart
//
//  Created by 汪敏思 on 5/11/2023.
//

import SwiftUI

@main
struct chartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
