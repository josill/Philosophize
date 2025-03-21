import SwiftUI

enum ThemeOptions: Theme, CaseIterable {
    // MARK: THeme Cases
    case midnightBlue
    case deepPurple
    case deepTeal
    case midnightRose
    case forestGreen
    case deepMaroon
    case deepGray
    case midnightTurquoise
    case darkGold
    case darkViolet
    case darkCyan
    
    // MARK: Theme Names
    var name: String {
        switch self {
        case .midnightBlue: return "Midnight Blue"
        case .deepPurple: return "Deep Purple"
        case .deepTeal: return "Deep Teal"
        case .midnightRose: return "Midnight Rose"
        case .forestGreen: return "Forest Green"
        case .deepMaroon: return "Deep Maroon"
        case .deepGray: return "Deep Gray"
        case .midnightTurquoise: return "Midnight Turquoise"
        case .darkGold: return "Dark Gold"
        case .darkViolet: return "Dark Violet"
        case .darkCyan: return "Dark Cyan"
        }
    }
    
    // MARK: Theme Colors
    var colors: ThemeColors {
        switch self {
        case .midnightBlue:
            return MidnightBlueColors()
        case .deepPurple:
            return DeepPurpleColors()
        case .deepTeal:
            return DeepTealColors()
        case .midnightRose:
            return MidnightRoseColors()
        case .forestGreen:
            return ForestGreenColors()
        case .deepMaroon:
            return DeepMaroonColors()
        case .deepGray:
            return DeepGrayColors()
        case .midnightTurquoise:
            return MidnightTurquoiseColors()
        case .darkGold:
            return DarkGoldColors()
        case .darkViolet:
            return DarkVioletColors()
        case .darkCyan:
            return DarkCyanColors()
        }
    }
    
    // MARK: - Theme Gradients
    var gradients: ThemeGradients {
        switch self {
        case .midnightBlue:
            return MidnightBlueGradients()
        case .deepPurple:
            return DeepPurpleGradients()
        case .deepTeal:
            return DeepTealGradients()
        case .midnightRose:
            return MidnightRoseGradients()
        case .forestGreen:
            return ForestGreenGradients()
        case .deepMaroon:
            return DeepMaroonGradients()
        case .deepGray:
            return DeepGrayGradients()
        case .midnightTurquoise:
            return MidnightTurquoiseGradients()
        case .darkGold:
            return DarkGoldGradients()
        case .darkViolet:
            return DarkVioletGradients()
        case .darkCyan:
            return DarkCyanGradients()
        }
    }
}

// MARK: - Color Implementations
struct MidnightBlueColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.015, green: 0.025, blue: 0.1)
}

struct DeepPurpleColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.13, green: 0.05, blue: 0.22)
}

struct DeepTealColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.02, green: 0.18, blue: 0.20)
}

struct MidnightRoseColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.22, green: 0.05, blue: 0.15)
}

struct ForestGreenColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.05, green: 0.15, blue: 0.07)
}

struct DeepMaroonColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.25, green: 0.05, blue: 0.05)
}

struct DeepGrayColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.10, green: 0.10, blue: 0.12)
}

struct MidnightTurquoiseColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.04, green: 0.18, blue: 0.20)
}

struct DarkGoldColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.22, green: 0.18, blue: 0.05)
}

struct DarkVioletColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.18, green: 0.05, blue: 0.25)
}

struct DarkCyanColors: ThemeColors {
    var text: Color = .white
    var background: Color = Color(red: 0.03, green: 0.20, blue: 0.22)
}

// MARK: - Gradient Implementations
struct MidnightBlueGradients: ThemeGradients {
    var colors: [Color] = [
        Color(red: 0.012, green: 0.020, blue: 0.051),
        Color(red: 0.05, green: 0.08, blue: 0.25),
        Color(red: 0.08, green: 0.15, blue: 0.42),
        Color(red: 0.18, green: 0.28, blue: 0.65),
        Color(red: 0.35, green: 0.50, blue: 0.85)
    ]
}

struct DeepPurpleGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DeepPurple1"),
        Color("DeepPurple2"),
        Color("DeepPurple3"),
        Color("DeepPurple4"),
        Color("DeepPurple5")
    ]
}

struct DeepTealGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DeepTeal1"),
        Color("DeepTeal2"),
        Color("DeepTeal3"),
        Color("DeepTeal4"),
        Color("DeepTeal5")
    ]
}

struct MidnightRoseGradients: ThemeGradients {
    var colors: [Color] = [
        Color("MidnightRose1"),
        Color("MidnightRose2"),
        Color("MidnightRose3"),
        Color("MidnightRose4"),
        Color("MidnightRose5")
    ]
}

struct ForestGreenGradients: ThemeGradients {
    var colors: [Color] = [
        Color("ForestGreen1"),
        Color("ForestGreen2"),
        Color("ForestGreen3"),
        Color("ForestGreen4"),
        Color("ForestGreen5")
    ]
}

struct DeepMaroonGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DeepMaroon1"),
        Color("DeepMaroon2"),
        Color("DeepMaroon3"),
        Color("DeepMaroon4"),
        Color("DeepMaroon5")
    ]
}

struct DeepGrayGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DeepGray1"),
        Color("DeepGray2"),
        Color("DeepGray3"),
        Color("DeepGray4"),
        Color("DeepGray5")
    ]
}

struct MidnightTurquoiseGradients: ThemeGradients {
    var colors: [Color] = [
        Color("MidnightTurquoise1"),
        Color("MidnightTurquoise2"),
        Color("MidnightTurquoise3"),
        Color("MidnightTurquoise4"),
        Color("MidnightTurquoise5")
    ]
}

struct DarkGoldGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DarkGold1"),
        Color("DarkGold2"),
        Color("DarkGold3"),
        Color("DarkGold4"),
        Color("DarkGold5")
    ]
}

struct DarkVioletGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DarkViolet1"),
        Color("DarkViolet2"),
        Color("DarkViolet3"),
        Color("DarkViolet4"),
        Color("DarkViolet5")
    ]
}

struct DarkCyanGradients: ThemeGradients {
    var colors: [Color] = [
        Color("DarkCyan1"),
        Color("DarkCyan2"),
        Color("DarkCyan3"),
        Color("DarkCyan4"),
        Color("DarkCyan5")
    ]
}
