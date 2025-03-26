import SwiftUI

struct QuoteView: View {
    let quote: String
    
    var body: some View {
        #if os(macOS)
        macOSQuoteView(text: quote)
        #else
        iOSQuoteView(text: quote)
        #endif
    }
}

struct QuoteMarkView: View {
    var delay: Double = 0
    
    var body: some View {
        LottieView(fileName: "quote-animation", animationWidth: 40, animationHeight: 80, delay: delay)
    }
}
