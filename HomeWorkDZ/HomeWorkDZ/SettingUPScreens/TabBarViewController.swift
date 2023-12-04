import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    func setupUI() {
        view.backgroundColor = .white
        let episodesViewController = CollectionEpisodesViewController()
        let favouritesViewController = FavouritesCollectionViewController()
        let episodesNavController = UINavigationController(rootViewController: episodesViewController)
        let favouritesNavController = UINavigationController(rootViewController: favouritesViewController)
        
        episodesNavController.tabBarItem = UITabBarItem(
            title: "",
            image: .init(named: "Home"),
            tag: 0)
        episodesNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 119.01, bottom: 0, right: 0)
        
        favouritesNavController.tabBarItem = UITabBarItem(
            title: "",
            image: .init(named: "VectorBlue"),
            tag: 1)
        
        favouritesNavController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 119.01)
        
        setViewControllers([episodesNavController, favouritesNavController], animated: true)
    }
}
