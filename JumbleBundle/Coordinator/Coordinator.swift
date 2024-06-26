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
    func moveToChild(coordinator: Coordinator)
    func removeChildCoordinators()
}

class BaseCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    
    
    // MARK: - init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - Methods
    
    // coordinator를 연결 짓기 위한 필수 메서드입니다
    // override func start()로 사용해주세요
    func start() {
        print("코디네이터 연결이 필요합니다")
    }
    
    // 하위 Coordinator를 연결합니다
    func moveToChild(coordinator: Coordinator) {
        childCoordinator.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    // 하위 Coordinator를 제거합니다
    func removeChildCoordinators() {
        childCoordinator.forEach { $0.removeChildCoordinators() }
        childCoordinator.removeAll()
    }
}
