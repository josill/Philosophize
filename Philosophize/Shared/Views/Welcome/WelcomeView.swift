import SwiftUI

struct WelcomeView: View {
    @State private var showMainView = false
    @State private var showWelcomeButton = false
    
    func onAnimationComplete() -> Void {
        showWelcomeButton = true
    }
    
    var body: some View {
        ZStack {
            Group {
                GradientBackgroundView {
                    ZStack {
                        QuoteView(
                            quote: "The unexamined life is a life not worth living. - Socrates",
                            onAnimationComplete: onAnimationComplete)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    if showWelcomeButton {
                        WelcomeViewButton {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showMainView = true
                            }
                        }
                        .transition(.opacity.combined(with: .scale))
                    }
                    
                    Spacer().frame(height: 60)
                }
            }
            .opacity(showMainView ? 0 : 1)
            
            if showMainView {
                PhilosopherSelectView()
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .scale(scale: 1.05)).animation(.easeInOut(duration: 2.5)),
                        removal: .opacity.animation(.easeOut(duration: 0.5))
                    ))
            }
        }
    }
}

#Preview {
    WelcomeView()
}
