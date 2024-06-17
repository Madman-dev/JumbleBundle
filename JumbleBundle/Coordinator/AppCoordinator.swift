//
//  AppCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/17/24.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    
    override func start() {
        showHomeScreen()
    }
    
    func showHomeScreen() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinator.append(coordinator)
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func pushToNextViewController() {
        let rxSwiftVC = RxSwiftTableviewVC()
        
    }
}

//extension AppCoordinator: HomeCoordinatorDelegate {
//
//    /// ViewController에서 지정된 다음 화면으로 push하는 메서드입니다
//    func pushToNextViewController() {
//        let coordinator = TestCoordinator(navigationController: navigationController)
//        coordinator.delegate = self
//        coordinator.start()
//        childCoordinator.append(coordinator)
//    }
//}
