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

//struct QuoteView: View {
//    @State private var isChangeOffset = false
//    
//    var body: some View {
//        Rectangle().foregroundStyle(Color.blue)
//        
//        RoundedRectangle(cornerRadius: 35)
//            .foregroundStyle(.white)
//            .offset(y: -800)
//        
//        ZStack {
//            Text("Lorem ipsum")
//                .font(.system(size: 35))
//                .fontWeight(.semibold)
//                .foregroundStyle(.white)
//                .multilineTextAlignment(.leading)
//                .frame(width: 350, height: 200)
//        }
//    }
//}

#Preview {
    WelcomeView(
        quotes: [
            "The unexamined life is not worth living. - Socrates",
            "I think, therefore I am. - René Descartes"
        ])
}
