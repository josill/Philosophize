//
//  PhilosophizeApp.swift
//  Philosophize
//
//  Created by Jonathan Sillak on 15.03.2025.
//

import SwiftUI
import SwiftData

@main
struct PhilosophizeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .onOpenURL { url in
//                    print("Received URL: \(url.absoluteString)")
//                        
//                    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
//                        print("Failed to create URL components")
//                        return
//                    }
//                    
//                    print("URL scheme: \(components.scheme ?? "none")")
//                    print("URL host: \(components.host ?? "none")")
//                    print("URL path: \(components.path)")
//                    print("URL query items: \(components.queryItems ?? [])")
//                    
//                    guard let host = components.host else {
//                        print("No host in URL")
//                        return
//                    }
//                    
////                    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
////                          let host = components.host else {
////                        return
////                    }
////                    
//                    switch host {
//                    case "quote":
//                        if let id = components.queryItems?.first(where: { $0.name == "id" })?.value {
//                            print("Opening quote ID: \(id)")
//                        }
//                    default:
//                        break
//                    }
//                }
        }
        .modelContainer(sharedModelContainer)
    }
}
