import SwiftUI

struct GradientBackgroundView<Content: View>: View {
    private let animationSpeed: Double
    private let blurRadius: CGFloat
    private let glowOpacity: Double
    
    private let gradientColors: [Color]
    private let backgroundColor: Color
    
    private let content: Content
    
    // Animation state properties
    @State private var stageOpacity: Double = 0
    @State private var stageScale: CGFloat = 0.7
    
    @State private var whiteCircleOpacity: Double = 0
    @State private var whiteCircleScale: CGFloat = 0.5
    
    // Replace boolean with a progress value for smoother transition
    @State private var textColorProgress: Double = 0
    
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
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Background with ignoresSafeArea to prevent NavigationStack animation issues
            backgroundColor
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                ZStack {
                    // Stage light with fixed position
                    let smallestDimension = min(geometry.size.width, geometry.size.height)
                    
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: gradientColors),
                                center: .center,
                                startRadius: 0,
                                endRadius: smallestDimension * 0.7
                            )
                        )
                        .frame(width: min(geometry.size.width, geometry.size.height) * 1.4)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .blur(radius: blurRadius / 3)
                        .opacity(stageOpacity)
                        .scaleEffect(stageScale)
                    
                    Circle()
                        .fill(Color.white.opacity(whiteCircleOpacity))
                        .frame(width: 200, height: 200)
                        .blur(radius: 40)
                        .opacity(whiteCircleOpacity)
                        .scaleEffect(whiteCircleScale)
                    
                    
                    VStack {
                        Spacer()
                        
                        // Start with pure white text and transition to black
                        ZStack {
                            // White text layer that fades out
                            content
                                .foregroundColor(.white)
                                .opacity(1 - textColorProgress)
                            
                            // Black text layer that fades in
                            content
                                .foregroundColor(.black)
                                .opacity(textColorProgress)
                        }
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            // This prevents the NavigationStack from animating this view
            .transition(.identity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: animationSpeed)) {
                stageOpacity = 1
                stageScale = 2
            }

            // Animate the white circle with a slight delay
            withAnimation(.easeInOut(duration: animationSpeed)) {
                whiteCircleOpacity = 0.7
                whiteCircleScale = 2
            }
            
            withAnimation(.easeInOut(duration: animationSpeed * 0.8)) {
                textColorProgress = 1
            }
        }
    }
}

#Preview {
    NavigationStack {
        GradientBackgroundView(
            gradientColors: [
                Color(red: 0.01, green: 0.02, blue: 0.13),  // Deep midnight blue (almost black)
                Color(red: 0.05, green: 0.08, blue: 0.25),  // Dark navy blue
                Color(red: 0.08, green: 0.15, blue: 0.42),  // Medium midnight blue
                Color(red: 0.18, green: 0.28, blue: 0.65),  // Electric blue
                Color(red: 0.35, green: 0.50, blue: 0.85)   // Bright electric blue (for highlights)
            ],
            backgroundColor: Color(red: 0.015, green: 0.025, blue: 0.1),  // Rich dark blue
            blurRadius: 80,  // Reduced blur for better visibility
            glowOpacity: 0.7  // Increased opacity for better visibility
        ) {
            VStack(spacing: 10) {
                Text("11:23")
                    .font(.system(size: 88, weight: .medium, design: .rounded))
                Text("Tuesday, 18 April")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
            }
        }
    }
}
