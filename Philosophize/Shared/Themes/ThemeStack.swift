import SwiftUI

struct ThemeStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            ThemeManager.shared.currentTheme.background
                .ignoresSafeArea()
            content
        }
    }
}
