import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    static let shared = Router()
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func backToRoot() {
        path = NavigationPath()
    }
}
