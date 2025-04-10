import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var themeManager = ThemeManager.shared
    @ObservedObject private var router = Router.shared
    @ObservedObject private var deepLinkHandler = DeepLinkHandler.shared
    
    @Environment(\.managedObjectContext) private var viewContext
    
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
                case .home: HomeView().navigationBarBackButtonHidden(true)
                case .quote(let id): QuoteDetailView(quoteId: id).navigationBarBackButtonHidden(true)
                case .notFound: NotFoundView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
