//
//  MainCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

protocol HomeCoordinatorDelegate {
    func pushToNextViewController()
}

class HomeCoordinator: BaseCoordinator, HomeViewControllerDelegate {
    func pushToNextScreen() {
        delegate?.pushToNextViewController()
    }
    
    var delegate: HomeCoordinatorDelegate?

    override func start() {
        print("홈 화면 생성 필요")
        let homeViewController = MainVC()
        homeViewController.delegate = self

        navigationController.viewControllers = [homeViewController]
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func pushToNextViewController() {
        delegate?.pushToNextViewController()
    }
}
