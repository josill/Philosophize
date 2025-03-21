import SwiftUI

struct QuoteDetailView: View {
    let quoteId: String
    
    var body: some View {
        VStack {
            Text("Quote ID: \(quoteId)")
                .font(.largeTitle)
        }
        .onAppear() {
            print("QuoteDetailView")
        }
    }
}
