import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }()
    
    private let loadingComponentImageView: UIImageView = {
        let loadingComponentImageView = UIImageView()
        loadingComponentImageView.image = UIImage(named: "Loading component")
        loadingComponentImageView.contentMode = .scaleAspectFill
        return loadingComponentImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        loadingComponentImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigateToMainScreen()
        }
        
        [logoImageView, loadingComponentImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        makesAnimatedImage()
        setupImageConstraint()
    }
    
    private func navigateToMainScreen() {
        let mainViewController = TabBarViewController()
        UIApplication.shared.windows.first?.rootViewController = mainViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func makesAnimatedImage() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2)
        rotationAnimation.duration = 3
        loadingComponentImageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func setupImageConstraint() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            loadingComponentImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 347),
            loadingComponentImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 81),
            loadingComponentImageView.heightAnchor.constraint(equalToConstant: 200),
            loadingComponentImageView.widthAnchor.constraint(equalToConstant: 200)])
    }
}

