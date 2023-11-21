
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let firstVC = switchingScreenViewController()
        let secondVC = CollectionViewController()
        let threeVC = ViewController()
        let fourVC = ScrollViewController()
        view.backgroundColor = .white
        
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        let threeNavController = UINavigationController(rootViewController: threeVC)
        let fourNavController = UINavigationController(rootViewController: fourVC)
//
//        firstNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
//        secondNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
//        threeNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
//        
//        setViewControllers([firstNavController, secondNavController, threeNavController], animated: true)
    }

}
