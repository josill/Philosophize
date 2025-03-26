import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var themeManager = ThemeManager.shared
    @ObservedObject private var router = Router.shared
    @ObservedObject private var deepLinkHandler = DeepLinkHandler.shared
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack(path: $router.path) {
            WelcomeView()
            .environmentObject(themeManager)
            .onOpenURL { url in
                deepLinkHandler.handleDeepLink(url)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .welcome: WelcomeView()
                case .quote(let id): QuoteDetailView(quoteId: id)
                case .notFound: NotFoundView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
