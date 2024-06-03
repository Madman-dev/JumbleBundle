//
//  SceneDelegate.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootVC = MainVC()
        
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        window?.makeKeyAndVisible()
    }
}

