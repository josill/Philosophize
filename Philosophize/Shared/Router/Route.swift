import Foundation

enum Route {
    case welcome
    case quote(id: UUID)
    case notFound
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .welcome:
            hasher.combine(0)
        case .quote(let id):
            hasher.combine(1)
            hasher.combine(id)
        case .notFound:
            hasher.combine(2)
        }
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.welcome, .welcome):
            return true
        case (.quote(let lhsId), .quote(let rhsId)):
            return lhsId == rhsId
        case (.notFound, .notFound):
            return true
        default:
            return false
        }
    }
}
