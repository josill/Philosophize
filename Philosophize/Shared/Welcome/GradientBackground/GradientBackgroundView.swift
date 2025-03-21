import SwiftUI

struct GradientBackgroundView<Content: View>: View {
    private let theme: Theme = ThemeManager.shared.currentTheme
    
    private let animationSpeed: Double
    private let blurRadius: CGFloat
    private let glowOpacity: Double
    
    private let content: Content
    
    @State private var stageOpacity: Double = 0
    @State private var stageScale: CGFloat = 0.7
    
    @State private var whiteCircleOpacity: Double = 0
    @State private var whiteCircleScale: CGFloat = 0.5
    
    @State private var textColorProgress: Double = 0
    
    init(
        animationSpeed: Double = 5.5,
        blurRadius: CGFloat = 130,
        glowOpacity: Double = 0.2,
        @ViewBuilder content: () -> Content
    ) {
        self.animationSpeed = animationSpeed
        self.blurRadius = blurRadius
        self.glowOpacity = glowOpacity
        
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            theme.backgroundColor()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                ZStack {
                    theme.radialGradient(endRadius: 20)
                        .frame(width: 120, height: 120)
                        .blur(radius: 40)
                        .opacity(whiteCircleOpacity)
                        .scaleEffect(whiteCircleScale)
                    
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
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
            .transition(.identity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: animationSpeed)) {
                stageOpacity = 1
                stageScale = 2
            }

            withAnimation(.easeInOut(duration: animationSpeed)) {
                whiteCircleOpacity = 0.9
                whiteCircleScale = 2
            }
            
            withAnimation(.easeInOut(duration: animationSpeed * 0.8)) {
                textColorProgress = 1
            }
        }
    }
}

struct AutoUpdatingClock: View {
    @State private var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(timeString(from: currentDate))
                .font(.system(size: 88, weight: .medium, design: .rounded))
            Text(dateString(from: currentDate))
                .font(.system(size: 24, weight: .semibold, design: .rounded))
        }
        .onReceive(timer) { _ in
            currentDate = Date()
        }
    }
    
    private func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    private func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: date)
    }
}

#Preview {
    NavigationStack {
        GradientBackgroundView(
            blurRadius: 80,
            glowOpacity: 0.7
        ) {
            AutoUpdatingClock()
        }
    }
}
