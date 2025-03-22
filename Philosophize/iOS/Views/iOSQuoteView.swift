import SwiftUI

#if os(iOS)
struct iOSQuoteView: View {
    let theme: Theme = ThemeManager.shared.currentTheme
    
    let text: String
    @State private var textOpacity: Double = 0
    @State private var displayCharacters = ""
    @State private var shouldStartTyping = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            if shouldStartTyping {
                Text(displayCharacters)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
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
        .frame(width: UIScreen.main.bounds.width / 2)
        .onAppear {
            startTypeWriterAnimation()
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
        iOSQuoteView(text: "The unexamined life is a life not worth living. - Socrates")
    }
}

#endif
