import SwiftUI

struct QuoteDetailView: View {
    @ObservedObject private var router = Router.shared

    @State private var quote: Quote?
    @State private var isLoading = true
    @State private var showMetadata = false
 
    private let quoteId: UUID
    private let quoteRepository: QuoteRepository
    
    init(quoteId: UUID) {
        self.quoteId = quoteId
        self.quoteRepository = QuoteRepository(coreDataStack: CoreDataStack.shared)
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading quote...")
            } else if let quoteText = quote?.text {
                QuoteView(quote: quoteText)
            } else {
                Color.clear
                .onAppear {
                    router.navigate(to: .notFound)
                }
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
        quote = quoteRepository.getQuoteById(id: quoteId)
        isLoading = false
    }
}

#Preview {
    QuoteDetailView(quoteId: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!)
}
