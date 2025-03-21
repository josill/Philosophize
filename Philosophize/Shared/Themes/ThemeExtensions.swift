import SwiftUI

// MARK: - Theme Extensions
extension Theme {
    var background: Color {
        return colors.background
    }
    
    var text: Color {
        return colors.text
    }
    
    var gradientColors: [Color] {
       return gradients.colors
   }
    
    func backgroundColor() -> Color {
        Color(background)
    }
   
   func linearGradient(startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) -> LinearGradient {
       LinearGradient(
           gradient: Gradient(colors: gradientColors),
           startPoint: startPoint,
           endPoint: endPoint
       )
   }
   
   func radialGradient(center: UnitPoint = .center, startRadius: CGFloat = 0, endRadius: CGFloat) -> RadialGradient {
       RadialGradient(
           gradient: Gradient(colors: gradientColors),
           center: center,
           startRadius: startRadius,
           endRadius: endRadius
       )
   }
   
   func angularGradient(center: UnitPoint = .center, startAngle: Angle = .degrees(0), endAngle: Angle = .degrees(360)) -> AngularGradient {
       AngularGradient(
           gradient: Gradient(colors: gradientColors),
           center: center,
           startAngle: startAngle,
           endAngle: endAngle
       )
   }
}

// MARK: - View Extensions
extension View {
    func withThemeBackground(_ theme: Theme) -> some View {
        self.background(theme.colors.background)
    }
    
    func withThemeText(_ theme: Theme) -> some View {
        self.foregroundColor(theme.colors.text)
    }
    
    func withThemeGradient(_ theme: Theme, startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) -> some View {
        self.background(theme.linearGradient(startPoint: startPoint, endPoint: endPoint))
    }
}
