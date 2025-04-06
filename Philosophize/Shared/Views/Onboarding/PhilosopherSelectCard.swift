import SwiftUI

struct PhilosopherSelectCard: View {
    let philosopher: Philosopher
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(isSelected ? Color.blue.opacity(0.2) : Color.white.opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: isSelected ? 2 : 1)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(philosopher.name)
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? .blue : .black)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Text("\(philosopher.quoteCount)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(isSelected ? .blue.opacity(0.8) : .gray)
                        
                        Image(systemName: "quote.bubble.fill")
                            .font(.system(size: 12))
                            .foregroundColor(isSelected ? .blue : .gray)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(isSelected ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                    )
                    
                    ZStack {
                        Circle()
                            .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                            .frame(width: 24, height: 24)
                        
                        if isSelected {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 16, height: 16)
                        }
                    }
                }
                
                Text(philosopher.description)
                    .font(.system(size: 15, design: .serif))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .padding(.top, 2)
                    
                Spacer(minLength: 0)
            }
            .padding(16)
        }
        .frame(height: 130)
        .shadow(color: Color.black.opacity(isSelected ? 0.1 : 0.05), radius: isSelected ? 8 : 5, x: 0, y: isSelected ? 4 : 2)
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .onTapGesture {
            withAnimation(.spring()) {
                onTap()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        
        PhilosopherSelectCard(philosopher: Philosopher(name: "Epictetus", description: "Reason is what you make of it.", quoteCount: 111), isSelected: false) {
        
        }
    }.ignoresSafeArea()
}
