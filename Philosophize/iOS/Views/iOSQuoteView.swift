import SwiftUI

#if os(iOS)
struct iOSQuoteView: View {
    var body: some View {
        HStack(spacing: 0) {
            QuoteMarkView()
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: 15, y: -110)
            QuoteMarkView(delay: 1)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: 10, y: -110)
            
            // TODO: make the gradient from circle to an oval
            // so it would make the entire quote turn from white to black
            
            Text("The unexamined life is a life not worth living.\n- Socrates")
                .frame(width: UIScreen.main.bounds.width / 1.2)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .border(Color.blue, width: 2)
            
            QuoteMarkView(delay: 2)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: -110, y: -10)
            QuoteMarkView(delay: 3)
                .frame(width: 20, height: 20)
                .border(Color.blue, width: 2)
                .offset(x: -115, y: -10)
        }
        .frame(width: UIScreen.main.bounds.width / 2)
    }
}

#Preview {
    iOSQuoteView()
}

#endif
