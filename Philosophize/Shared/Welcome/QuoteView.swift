import SwiftUI

struct QuoteView: View {
    var body: some View {
        #if os(macOS)
        macOSQuoteView(text: "The unexamined life is a life not worth living. - Socrates")
        #else
        iOSQuoteView(text: "The unexamined life is a life not worth living. - Socrates")
        #endif
    }
}

struct QuoteMarkView: View {
    var delay: Double = 0
    
    var body: some View {
        LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: delay)
    }
}
