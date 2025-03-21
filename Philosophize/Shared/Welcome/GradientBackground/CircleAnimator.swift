import SwiftUI

public class CircleAnimator: ObservableObject {
    class Circle: Identifiable {
        var position: CGPoint
        let id = UUID().uuidString
        let color: Color
        var opacity: Double
        
        internal init(position: CGPoint, color: Color, opacity: Double = 0.0) {
            self.position = position
            self.color = color
            self.opacity = opacity
        }
    }
        
    @Published private(set) var circles: [Circle] = []
    @Published private(set) var isAnimated: Bool = false
        
    init(colors: [Color]) {
        // Initialize circles at center position with 0 opacity
        circles = colors.map({ color in
            Circle(position: CGPoint(x: 0.5, y: 0.5), color: color, opacity: 0.0)
        })
    }

    func animate() {
        // Just update the opacity of existing circles
        isAnimated = true
        
        // Update the opacity of each circle
        for index in circles.indices {
            circles[index].opacity = 1.0
        }
    }
}
