import SwiftUI

struct WelcomeView: View {
    @State private var isSplashScreen = true
    
    let quotes: [String]
    
    var body: some View {
        ZStack {
            Group {
                if isSplashScreen {
                    SplashScreen()
                } else {
                    MainView()
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    isSplashScreen = true
                })
            }
        }
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
            backgroundColor: Color(red: 0.015, green: 0.025, blue: 0.1),
            animationSpeed: 6.0,
            blurRadius: 150,
            glowOpacity: 0.25
        ) {
            ZStack {                
                HStack {
                    LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80)
                        .frame(width: 20, height: 20)
                        .border(Color.blue, width: 2)
                        .offset(x: 16, y: 50)
                    LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 1)
                        .frame(width: 20, height: 20)
                        .border(Color.blue, width: 2)
                        .offset(y: 50)
                    
                    Text("The unexamined life is not worth living. - Socrates")
                        .font(.system(size: 18, weight: .light, design: .rounded))
                    VStack(spacing: 10) {
                        Text("11:23")
                            .font(.system(size: 88, weight: .medium, design: .rounded))
                        Text("Tuesday, 18 April")
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                    }
                        
                    LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 2)
                        .frame(width: 20, height: 20)
                        .border(Color.blue, width: 2)
                        .offset(x: -20, y: 20)
                    LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 3)
                        .frame(width: 20, height: 20)
                        .border(Color.blue, width: 2)
                        .offset(x: -36, y: 20)
               }
            }
        }
    }
}

struct MainView: View {
    @State private var isChangeOffset = false
    @State private var isChangeOpacity = false
    
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

struct QuoteView: View {
    @State private var isChangeOffset = false
    
    var body: some View {
        Rectangle().foregroundStyle(Color.blue)
        
        RoundedRectangle(cornerRadius: 35)
            .foregroundStyle(.white)
            .offset(y: -800)
        
        ZStack {
            Text("Lorem ipsum")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .frame(width: 350, height: 200)
        }
    }
}

#Preview {
    WelcomeView(
        quotes: [
            "The unexamined life is not worth living. - Socrates",
            "I think, therefore I am. - René Descartes"
        ])
}
