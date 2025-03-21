import SwiftUI

// MARK: - Theme Manager
final class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme
    
    static let shared = ThemeManager()
    
    private init() {
        self.currentTheme = ThemeOptions.midnightBlue
    }
    
    func setTheme(_ theme: Theme) {
        self.currentTheme = theme
    }
}
