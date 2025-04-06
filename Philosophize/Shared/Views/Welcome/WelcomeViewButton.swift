import SwiftUI

struct WelcomeViewButton: View {
    @State private var isVisible = false
    @State private var isHovered = false
    @State private var isPressed = false
    @State private var buttonOpacity: Double = 0
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Begin Journey")
                .font(.system(size: 18, weight: .medium, design: .serif))
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black.opacity(0.4))
                            .blur(radius: 1)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white.opacity(0.7), Color.white.opacity(0.2)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1.5
                            )
                    }
                )
                .shadow(color: Color.white.opacity(isHovered ? 0.3 : 0.1), radius: isHovered ? 15 : 10)
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isHovered)
                .animation(.spring(response: 0.2, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
        .opacity(buttonOpacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                buttonOpacity = 1.0
            }
        }
        .pressEvents {
            withAnimation {
                isPressed = true
            }
        } onRelease: {
            withAnimation {
                isPressed = false
            }
        }
    }
}

// Helper for pressure sensitivity
extension View {
    func pressEvents(onPress: @escaping () -> Void, onRelease: @escaping () -> Void) -> some View {
        self
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in onPress() }
                    .onEnded { _ in onRelease() }
            )
    }
}

#Preview {
    WelcomeViewButton {
    }
}
