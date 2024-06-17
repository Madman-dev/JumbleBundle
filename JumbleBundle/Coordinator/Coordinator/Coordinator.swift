//
//  Coordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func removeChild()
}

class BaseCoordinator: Coordinator {
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("코디네이터 연결이 필요합니다")
    }
    
    func removeChild() {
        childCoordinator.forEach { $0.removeChild() }
        childCoordinator.removeAll()
    }
}
