import SwiftUI
import Lottie

#if os(macOS)
struct macOSLottieView: NSViewRepresentable {
    var fileName: String
    var animationWidth: CGFloat?
    var animationHeight: CGFloat?
    var loopMode: LottieLoopMode = .playOnce
    var delay: Double = 0.0
    
    func makeNSView(context: Context) -> NSView {
        let view = NSView(frame: .zero)
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            animationView.play()
        }
        
        view.addSubview(animationView)
        
        var constraints = [NSLayoutConstraint]()
        
        if let width = animationWidth {
            constraints.append(animationView.widthAnchor.constraint(equalToConstant: width))
        } else {
            constraints.append(animationView.widthAnchor.constraint(equalTo: view.widthAnchor))
        }
        
        if let height = animationHeight {
            constraints.append(animationView.heightAnchor.constraint(equalToConstant: height))
        } else {
            constraints.append(animationView.heightAnchor.constraint(equalTo: view.heightAnchor))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        // Update logic if needed
    }
}
#endif
