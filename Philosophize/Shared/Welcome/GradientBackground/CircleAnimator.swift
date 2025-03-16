import SwiftUI

public class CircleAnimator: ObservableObject {
    class Circle: Identifiable {
        var position: CGPoint
        let id = UUID().uuidString
        let color: Color
        
        internal init(position: CGPoint, color: Color)
        {
            self.position = position
            self.color = color
        }
    }
        
    @Published private(set) var circles: [Circle] = []
        
    init(colors: [Color]) {
        circles = colors.map({ color in
            Circle(position: CircleAnimator.generateRandomPosition(), color: color)
        })
    }

    func animate() {
        var newCircles: [Circle] = []
        
        for circle in circles {
            newCircles.append(Circle(
                position: CGPoint(x: 0.5, y: 0.5),
                color: circle.color
            ))
        }
        
        circles = newCircles
    }
        
    static func generateRandomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0...1), y:CGFloat.random(in: 0...1))
    }
}
