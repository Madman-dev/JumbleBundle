//
//  SceneDelegate.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordiator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        mainCoordiator = MainCoordinator()
        mainCoordiator?.startCoordinator()
        
        window?.rootViewController = mainCoordiator?.navigationController
        window?.makeKeyAndVisible()
    }
}

