import SwiftUI

class DeepLinkHandler: ObservableObject {
    static let shared = DeepLinkHandler()
    private let router = Router.shared
    
    func handleDeepLink(_ url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        guard let path = url.host else {
            router.navigate(to: .notFound)
            return
        }
        
        let pathComponents = url.pathComponents.filter { $0 != "/" }
        
        let queryItems = components?.queryItems ?? []
        let params = queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }
        
        switch path {
        case "quote":
            if pathComponents.count == 1, let quoteId = UUID(uuidString: pathComponents[0]) {
                router.navigate(to: .quote(id: quoteId))
            } else {
                router.navigate(to: .notFound)
            }
        default:
            router.navigate(to: .notFound)
        }
    }
}
