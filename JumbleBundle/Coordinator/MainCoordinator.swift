//
//  MainCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // 최초 화면 설정
    func start() {
        let rootVC = MainVC()
        rootVC.coordinator = self
        navigationController.pushViewController(rootVC, animated: false)
    }
    
    func moveToSelectedRxTableView(_ vc: UIViewController) {
        let child = RxSwiftCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinator.append(child)
        child.start(with: vc)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if coordinator === child {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
