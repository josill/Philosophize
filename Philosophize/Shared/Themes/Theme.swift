import SwiftUI

// MARK: - Theme Protocol
protocol Theme {
    var name: String { get }
    var colors: ThemeColors { get }
    var gradients: ThemeGradients { get }
}

// MARK: - Theme Colors
protocol ThemeColors {
    var text: Color { get }
    var background: Color { get }
}


// MARK: - Theme Gradients
protocol ThemeGradients {
    var colors: [Color] { get }
}
