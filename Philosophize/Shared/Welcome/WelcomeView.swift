import SwiftUI

struct WelcomeView: View {
    @State private var isSplashScreen = true

    var body: some View {
        ZStack {
            Group {
                if isSplashScreen {
                    SplashScreen()
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                isSplashScreen = true
                            })
                        }
                } else {
                    MainView()
                }
            }
        }
#if os(macOS)
.frame(maxHeight: NSScreen.main.frame.height, maxWidth: NSScreen.main.frame.width)
#elseif os(iOS)
.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
#endif
    }
}

struct SplashScreen: View {
    var body: some View {
        GradientBackgroundView(
            gradientColors: [
                Color(red: 0.01, green: 0.02, blue: 0.13),  // Deep midnight blue
                Color(red: 0.05, green: 0.08, blue: 0.25),  // Dark navy blue
                Color(red: 0.08, green: 0.15, blue: 0.42),  // Medium midnight blue
                Color(red: 0.18, green: 0.28, blue: 0.65),  // Electric blue
                Color(red: 0.35, green: 0.50, blue: 0.85)   // Bright electric blue
            ],
            animationSpeed: 6.0,
            blurRadius: 150,
            glowOpacity: 0.25
        ) {
            ZStack {
                QuoteView()
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        ZStack {
            #if os(macOS)
            Color(NSColor.windowBackgroundColor).ignoresSafeArea()
            #elseif os(iOS)
            Color(.black).ignoresSafeArea()
            #endif
        
            QuoteView()
        }
    }
}

#Preview {
    WelcomeView()
}
