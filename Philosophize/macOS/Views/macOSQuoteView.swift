import SwiftUI


#if os(macOS)
struct macOSQuoteView: View {
    let theme: Theme = ThemeManager.shared.currentTheme
    @State private var screenWidth: CGFloat = NSScreen.main?.frame.width ?? 1024
    
    let text: String
    @State private var textOpacity: Double = 0
    @State private var displayCharacters = ""
    @State private var shouldStartTyping = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                if shouldStartTyping {
                    Text(displayCharacters)
                        .frame(width: geometry.size.width / 2.4)
                        .foregroundColor(theme.text)
                        .opacity(textOpacity)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .lineSpacing(5)
                        .multilineTextAlignment(.leading)
                        .onReceive(timer) { _ in
                            renderCharacters();
                        }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .ignoresSafeArea()
            .onAppear {
                startTypeWriterAnimation()
            }
        }
    }
    
    func startTypeWriterAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            shouldStartTyping = true
            textOpacity = 0
        }
    }
    
    func renderCharacters() {
        if displayCharacters.count < text.count {
            let index = text.index(text.startIndex, offsetBy: displayCharacters.count)
            displayCharacters.append(text[index])
            
            withAnimation(.easeInOut(duration: 0.2)) {
                textOpacity = Double(displayCharacters.count) / Double(text.count)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        macOSQuoteView(text: "The unexamined life is a life not worth living. - Socrates")
    }
}

#endif
