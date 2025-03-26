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
    }
}

struct SplashScreen: View {
    var body: some View {
        GradientBackgroundView(
            animationSpeed: 6.0,
            blurRadius: 150,
            glowOpacity: 0.25
        ) {
            ZStack {
                QuoteView(quote: "The unexamined life is a life not worth living. - Socrates")
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        ZStack {
            QuoteView(quote: "The unexamined life is a life not worth living. - Socrates")
        }
    }
}

#Preview {
    WelcomeView()
}
