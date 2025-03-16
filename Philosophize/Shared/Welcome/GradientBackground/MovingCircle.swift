import SwiftUI

struct MovingCircle: Shape {
    var originOffset: CGPoint
    
    var animatableData: CGPoint.AnimatableData {
        get { originOffset.animatableData }
        set { originOffset.animatableData = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let adjustedX = rect.width * originOffset.x
        let adjustedY = rect.height * originOffset.y
        let smallestDimension = min(rect.width, rect.height)
        
        path.addArc(
            center: CGPoint(x: adjustedX, y: adjustedY),
            radius: smallestDimension * 0.7,
            startAngle: .zero,
            endAngle: .degrees(360),
            clockwise: true)
        
        return path
    }
}
