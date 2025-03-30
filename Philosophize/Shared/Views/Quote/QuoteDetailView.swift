import SwiftUI

struct QuoteDetailView: View {
    private let repository = QuoteRepository.shared
    @ObservedObject private var router = Router.shared

    @State private var quote: Quote?
    @State private var isLoading = true
    @State private var showMetadata = false
 
    private let quoteId: UUID
    
    init(quoteId: UUID) {
        self.quoteId = quoteId
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading quote...")
            } else if let quoteText = quote?.text {
                QuoteView(quote: quoteText)
            }
        }
        .padding()
        .onAppear {
            fetchQuote()
        }
        .sheet(isPresented: $showMetadata) {
            Text("This app was brought to you by Hacking with Swift")
        }
    }
    
    private func fetchQuote() {
        isLoading = true
        
        quote = repository.getQuoteById(id: quoteId)
        if (quote == nil) {
            router.navigate(to: .notFound)
        }
        
        isLoading = false
    }
}

#Preview {
    QuoteDetailView(quoteId: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!)
}
