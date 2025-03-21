import SwiftUI

struct MovingCircle: View {
    let originOffset: CGPoint
    let opacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .position(
                    x: geometry.size.width * originOffset.x,
                    y: geometry.size.height * originOffset.y
                )
                .frame(width: min(geometry.size.width, geometry.size.height) * 1.4)
                .opacity(opacity)
        }
    }
}
