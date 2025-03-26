import SwiftUI

struct QuoteView: View {
    @State private var quoteId: String?
    
    var body: some View {
        Text("Hello, World: \(quoteId ?? "No quote yet")!")
    }
}
