//
//  RxSwiftCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

class RxSwiftCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nextVC = RxSwiftTableviewVC()
        nextVC.coordinator = self
    }
}
