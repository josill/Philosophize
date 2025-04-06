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
        ThemeStack {
            if isLoading {
                ProgressView("Loading quote...")
            } else if let quoteText = quote?.text {
                QuoteView(quote: quoteText)
                    .onTapGesture {
                        showMetadata = true
                    }
            }
        }
        .onAppear {
            fetchQuote()
        }
        .sheet(isPresented: $showMetadata) {
            Text("This app was brought to you by Hacking with Swift")
        }
    }
    
    private func fetchQuote() {
        isLoading = true
        
        repository.getQuoteByIdAsync(id: quoteId) { result in
            print("quote is : \(result)")
            switch result {
            case .success(let loadedQuote):
                quote = loadedQuote
            case .failure:
                router.navigate(to: .notFound)
            }
            
            self.isLoading = false
        }
    }
}

#Preview {
    QuoteDetailView(quoteId: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!)
}
