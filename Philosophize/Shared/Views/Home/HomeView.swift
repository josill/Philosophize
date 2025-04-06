import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            GradientBackgroundView {
                EmptyView()
            }
            
            VStack(spacing: 30) {
                Spacer()
                
                Text("Philosophize")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                    .padding(.top, 60)
                
                Text("Explore the wisdom of ancient and modern philosophy")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.95))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                
                VStack(spacing: 24) {
                    MainActionButton(
                        title: "Explore",
                        description: "Discover quotes from history's greatest minds",
                        icon: "book.fill",
                        color: Color(red: 0.2, green: 0.3, blue: 0.5),
                        action: {
                            // Leave empty for now
                        }
                    )
                    
                    MainActionButton(
                        title: "Write",
                        description: "Record your thoughts and reflections",
                        icon: "pencil.line",
                        color: Color(red: 0.35, green: 0.25, blue: 0.4),
                        action: {
                            // Leave empty for now
                        }
                    )
                }
                .padding(.horizontal, 24)
                
                Spacer()
                
                Text("Version 1.0")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Capsule().fill(Color.white.opacity(0.1)))
                    .padding(.bottom, 20)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainActionButton: View {
    let title: String
    let description: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isPressed = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    isPressed = false
                }
                action()
            }
        }) {
            HStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.15))
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: icon)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(.system(size: 16, design: .serif))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [color.opacity(0.4), color.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(
                            gradient: Gradient(colors: [color.opacity(0.5), color.opacity(0.1)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ), lineWidth: 1)
                }
            )
            .shadow(color: color.opacity(0.25), radius: 8, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.15), .clear]),
                        startPoint: .topLeading,
                        endPoint: .center
                    ))
                    .padding(2)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(isPressed ? 0.95 : 1)
    }
}

#Preview {
    HomeView()
}
