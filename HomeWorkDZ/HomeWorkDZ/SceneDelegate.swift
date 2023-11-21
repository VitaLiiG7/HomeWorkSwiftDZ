//
//  SceneDelegate.swift
//  HomeWorkDZ
//
//  Created by Виталий Горбунов on 14.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let applicationScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: applicationScene)
        let mainController = SwitchingScreenViewController()
        let navigationController = UINavigationController(rootViewController: mainController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

