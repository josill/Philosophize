import SwiftUI

#if os(iOS)
struct iOSQuoteView: View {
    let text: String
    @State private var displayCharacters = ""
    @State private var shouldStartTyping = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 0) {
//            QuoteMarkView()
//                .frame(width: 20, height: 20)
////                .border(Color.blue, width: 2)
//                .offset(x: 15, y: -110)
//            QuoteMarkView(delay: 1)
//                .frame(width: 20, height: 20)
////                .border(Color.blue, width: 2)
//                .offset(x: 10, y: -110)
            
            // TODO: make the gradient from circle to an oval
            // so it would make the entire quote turn from white to black
            
            // TODO: typewriter effect for quote
            // https://www.youtube.com/watch?v=paXszw-GypY
            if shouldStartTyping {
                Text(displayCharacters)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .lineSpacing(5)
                    .multilineTextAlignment(.leading)
                    .onReceive(timer) { _ in
                        if displayCharacters.count <  text.count {
                            let index = text.index(text.startIndex, offsetBy: displayCharacters.count)
                            displayCharacters.append(text[index])
                        }
                    }
            }
//                .border(Color.blue, width: 2)
            
//            QuoteMarkView(delay: 2)
//                .frame(width: 20, height: 20)
////                .border(Color.blue, width: 2)
//                .offset(x: -110, y: -10)
//            QuoteMarkView(delay: 3)
//                .frame(width: 20, height: 20)
////                .border(Color.blue, width: 2)
//                .offset(x: -115, y: -10)
        }
        .frame(width: UIScreen.main.bounds.width / 2)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                shouldStartTyping = true
            }
        }
    }
}

#Preview {
    iOSQuoteView(text: "The unexamined life is a life not worth living. - Socrates")
}

#endif
