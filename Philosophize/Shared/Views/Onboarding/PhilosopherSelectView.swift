import SwiftUI

struct Philosopher: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let quoteCount: Int
    var isSelected: Bool = false
}

struct PhilosopherSelectView: View {
    @State private var philosophers: [Philosopher] = [
        Philosopher(name: "Socrates", description: "Ancient Greek philosopher known for the Socratic method", quoteCount: 42),
        Philosopher(name: "Aristotle", description: "Founder of the Lyceum and the Peripatetic school", quoteCount: 56),
        Philosopher(name: "Plato", description: "Founder of the Academy in Athens", quoteCount: 38),
        Philosopher(name: "Confucius", description: "Chinese philosopher focused on ethics and morality", quoteCount: 47),
        Philosopher(name: "Nietzsche", description: "German philosopher known for perspectivism", quoteCount: 65),
        Philosopher(name: "Kant", description: "Central figure of modern philosophy", quoteCount: 29),
        Philosopher(name: "Descartes", description: "Father of modern philosophy", quoteCount: 18),
        Philosopher(name: "Sartre", description: "Key figure in existentialism", quoteCount: 24)
    ]
    
    @State private var selectedPhilosophers: Set<UUID> = []
    
    @ObservedObject private var router = Router.shared
    
    var body: some View {
        GradientBackgroundView {
            VStack(spacing: 20) {
                Text("Select philosophers")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.top, 40)
                    .foregroundColor(.white)
                
                Text("Choose the philosophers whose wisdom you'd like to explore")
                    .foregroundColor(.white)
                    .font(.system(size: 16, design: .serif))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .opacity(0.8)
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(philosophers.indices, id: \.self) { index in
                            PhilosopherSelectCard(
                                philosopher: philosophers[index],
                                isSelected: selectedPhilosophers.contains(philosophers[index].id),
                                onTap: {
                                    toggleSelection(for: index)
                                }
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    // TODO: add logic to save user's choice
                    router.navigate(to: .home)
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            selectedPhilosophers.isEmpty
                            ? AnyShapeStyle(Color.gray.opacity(0.5))
                            : AnyShapeStyle(LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                        )
                        .cornerRadius(15)
                }
                .disabled(selectedPhilosophers.isEmpty)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
    }
    
    private func toggleSelection(for index: Int) {
        let id = philosophers[index].id
        if selectedPhilosophers.contains(id) {
            selectedPhilosophers.remove(id)
        } else {
            selectedPhilosophers.insert(id)
        }
    }
}

#Preview {
    PhilosopherSelectView()
}
