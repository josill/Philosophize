import Foundation

enum Route {
    case welcome
    case home
    case quote(id: UUID)
    case notFound
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .welcome:
            hasher.combine(0)
        case .home:
            hasher.combine(1)
        case .quote(let id):
            hasher.combine(2)
            hasher.combine(id)
        case .notFound:
            hasher.combine(3)
        }
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.welcome, .welcome):
            return true
        case (.quote(let lhsId), .quote(let rhsId)):
            return lhsId == rhsId
        case (.home, .home):
            return true
        case (.notFound, .notFound):
            return true
        default:
            return false
        }
    }
}
