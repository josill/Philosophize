import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedQuoteId: String?
    
    var body: some View {
        NavigationStack {
            WelcomeView()
        }
        .onOpenURL { url in
        
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
