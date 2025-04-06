import SwiftUI

class Router: ObservableObject {
    @Published var path: [Route] = []
    
    static let shared = Router()
    
    func navigate(to route: Route) {
        if let currentRoute = path.last, currentRoute == route {
            return
        }
        path.append(route)
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func backToRoot() {
        path.removeAll()
    }
}
