import SwiftUI

struct QuoteDetailView: View {
    @StateObject private var router = Router.shared
 
    @State private var quote: Quote?
    @State private var isLoading = true
 
    private let quoteId: UUID
    private let quoteRepository: QuoteRepository
    
    init(quoteId: UUID) {
        self.quoteId = quoteId
        self.quoteRepository = QuoteRepository(coreDataService: CoreDataService.shared)
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading quote...")
            } else if let quote = quote, let text = quote.text {
                QuoteView(quote: text)
            } else {
                Color.clear
                .onAppear {
                    router.navigate(to: .notFound)
                }
            }
        }
        .padding()
        .onAppear {
            loadQuote()
        }
    }
    
    private func loadQuote() {
        isLoading = true
        quote = quoteRepository.get(byId: quoteId)
        isLoading = false
    }
}
