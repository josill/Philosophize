import SwiftUI


#if os(macOS)
struct macOSQuoteView: View {
    var body: some View {
        HStack {
            LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: 16, y: 50)
            LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 1)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(y: 50)
            
            // TODO: make the gradient from circle to an oval
            // so it would make the entire quote turn from white to black
            
            Text("The unexamined life is a life not worth living.\n- Socrates")
                #if os(macOS)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                #else
                .frame(width: UIScreen.main.bounds.width / 1.2)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                #endif
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .border(Color.blue, width: 2)
            
            LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 2)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: -20, y: 20)
            LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: 3)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: -36, y: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    macOSQuoteView()
}

#endif
