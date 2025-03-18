import SwiftUI
import Lottie

#if os(iOS)
struct iOSLottieView: UIViewRepresentable {
    var fileName: String
    var animationWidth: CGFloat?
    var animationHeight: CGFloat?
    var loopMode: LottieLoopMode = .playOnce
    var delay: Double = 0.0
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
//        animationView.backgroundColor = .black
        
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
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Update logic if needed
    }
}
#endif
