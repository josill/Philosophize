import SwiftUI

struct GradientBackgroundView<Content: View>: View {
    private let animationSpeed: Double
    private let blurRadius: CGFloat
    private let glowOpacity: Double
    
    private let gradientColors: [Color]
    private let backgroundColor: Color
    
    @StateObject private var animator: CircleAnimator
    private let content: Content
    
    init(
        gradientColors: [Color],
        backgroundColor: Color,
        animationSpeed: Double = 5.5,
        blurRadius: CGFloat = 130,
        glowOpacity: Double = 0.2,
        @ViewBuilder content: () -> Content
    ) {
        self.animationSpeed = animationSpeed
        self.blurRadius = blurRadius
        self.glowOpacity = glowOpacity

        self.gradientColors = gradientColors
        self.backgroundColor = backgroundColor
        
        let animator = CircleAnimator(colors: gradientColors)
        self._animator = StateObject(wrappedValue: animator)

        self.content = content()
    }
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position)
                        .foregroundStyle(circle.color)
                }
            }
            .blur(radius: blurRadius)
            
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 200, height: 200)
                .blur(radius: 40)
            
            VStack {
                Spacer()
                
                content
                    .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(content.blendMode(.hue))
                    .overlay(content.foregroundColor(.black).blendMode(.overlay))
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .onAppear {
            animateCircles()
        }
    }
    
    private func animateCircles() {
        withAnimation(.easeInOut(duration: animationSpeed)) {
            animator.animate()
        }
    }
}

#Preview {
    GradientBackgroundView(
        gradientColors: [
            Color(red: 0.01, green: 0.02, blue: 0.13),  // Deep midnight blue (almost black)
            Color(red: 0.05, green: 0.08, blue: 0.25),  // Dark navy blue
            Color(red: 0.08, green: 0.15, blue: 0.42),  // Medium midnight blue
            Color(red: 0.18, green: 0.28, blue: 0.65),  // Electric blue
            Color(red: 0.35, green: 0.50, blue: 0.85)   // Bright electric blue (for highlights)
        ],
        backgroundColor: Color(red: 0.015, green: 0.025, blue: 0.1)  // Rich dark blue
    ) {
        VStack(spacing: 10) {
            Text("11:23")
                .font(.system(size: 88, weight: .medium, design: .rounded))
            Text("Tuesday, 18 April")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
        }
    }
}
