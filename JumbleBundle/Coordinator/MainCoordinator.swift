//
//  MainCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var childCoordinator: [MainCoordinator] { get }
    
    func startCoordinator()
}

class MainCoordinator: Coordinator {
    var navigationController = UINavigationController()
    var childCoordinator: [MainCoordinator] = []
    
    // 최초 화면 설정
    func startCoordinator() {
        let rootVC = MainVC()
        navigationController.pushViewController(rootVC, animated: false)
    }
}
