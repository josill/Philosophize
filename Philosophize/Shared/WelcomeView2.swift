import SwiftUI

struct WelcomeView2: View {
    let quotes: [String]
    @State private var currentQuoteIndex = 0
    var onBrowseTopics: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "book.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text("Welcome to Philosophize")
                .font(.largeTitle)
                .bold()
            
            Text("Explore great philosophical ideas, create your own thoughts, and dive into the wisdom of the ages.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            VStack {
                Text("Quote of the moment:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(quotes[currentQuoteIndex])
                    .font(.title3)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: 500)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.1))
                    )
            }
            .padding(.top)
            
            Button("New Quote") {
                withAnimation {
                    currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
                }
            }
            .buttonStyle(.bordered)
            .padding(.top)
            
            Spacer()
            
            Button(action: onBrowseTopics) {
                Text("Browse Philosophy Topics")
                    .padding(.horizontal)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView2(
        quotes: [
            "The unexamined life is not worth living. - Socrates",
            "I think, therefore I am. - René Descartes"
        ],
        onBrowseTopics: {}
    )
}
