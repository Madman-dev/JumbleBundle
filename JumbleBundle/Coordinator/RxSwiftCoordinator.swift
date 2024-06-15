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
        let vc = RxSwiftTableviewVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func start(with vc: UIViewController) {
//        if let nextVC = vc as? RxSwiftTableviewVC {
//            nextVC.coordinator = self
//        }
//        navigationController.pushViewController(vc, animated: true)
//    }
    
//    func pushToViewController(_ vc: UIViewController) {
//        navigationController.pushViewController(vc, animated: true)
//    }
    
    // 되돌아가는 메서드 구현 - using didDisappear
//    func didTapBack() {
//        parentCoordinator?.childDidFinish(self)
//    }
}
