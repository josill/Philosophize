//
//  PhilosophizeApp.swift
//  Philosophize
//
//  Created by Jonathan Sillak on 15.03.2025.
//

import SwiftUI
import CoreData

@main
struct PhilosophizeApp: App {
    @StateObject private var coreDataStack = CoreDataStack.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              coreDataStack.persistentContainer.viewContext)
        }
    }
}
