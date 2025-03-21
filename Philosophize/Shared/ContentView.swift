import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var themeManager = ThemeManager.shared
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedQuoteId: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(themeManager.currentTheme.colors.background)
                                .ignoresSafeArea()
                WelcomeView()
                    .environmentObject(themeManager)
            }
        }
        .onOpenURL { url in
        
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
