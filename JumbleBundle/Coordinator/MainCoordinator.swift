//
//  MainCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // 최초 화면 설정
    func start() {
        navigationController.delegate = self
        
        let rootVC = MainVC()
        rootVC.coordinator = self
        navigationController.pushViewController(rootVC, animated: false)
    }
    
    // creating child coordinator and let it take over the app
    func moveToSelectedRxTableView() {
        let child = RxSwiftCoordinator(navigationController: navigationController)
        // set itself as current vc
        child.parentCoordinator = self
        childCoordinator.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinator.enumerated() {
            if coordinator === child {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
    
    // returning back with multiple viewcontrollers in child
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let rxSwiftController = fromViewController as? RxSwiftTableviewVC {
            childDidFinish(rxSwiftController.coordinator)
        }
    }
}
