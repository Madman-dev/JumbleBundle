//
//  RxSwiftCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

class RxSwiftCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController
    var childCoordinator = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // leave?
    }
    
    func start(with vc: UIViewController) {
        if let nextVC = vc as? RxSwiftTableviewVC {
            nextVC.coordinator = self
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushToViewController(_ vc: UIViewController) {
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didTapBack() {
        parentCoordinator?.childDidFinish(self)
    }
}
