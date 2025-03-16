import SwiftUI
import Lottie

struct LottieView: View {
    var fileName: String
    var animationWidth: CGFloat?
    var animationHeight: CGFloat?
    var loopMode: LottieLoopMode = .playOnce
    var delay: Double = 0.0
    
    var body: some View {
        #if os(iOS)
        iOSLottieView(fileName: fileName, animationWidth: animationWidth, animationHeight: animationHeight, delay: delay)
        #elseif os(macOS)
        macOSLottieView(fileName: fileName, animationWidth: animationWidth, animationHeight: animationHeight, delay: delay)
        #endif
    }
}
