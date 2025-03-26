import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var themeManager = ThemeManager.shared
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var linkActive = false
    @State private var selectedQuoteId: String?
    
    var body: some View {
        NavigationStack {
            WelcomeView()
                .environmentObject(themeManager)
                .onOpenURL { url in
                    print("Received deep link: \(url)")
                    linkActive = true
                }
                .navigationDestination(isPresented: $linkActive) {
                    Text("Quote detail view")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
