//
//  MainCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

protocol HomeCoordinatorDelegate {
    func pushToNext(row: UIViewController)
}

class HomeCoordinator: BaseCoordinator, MainVCDelegate {
    var delegate: HomeCoordinatorDelegate?
    
    override func start() {
        print("화면이 생성되었습니다.")
        let homeController = MainVC()
        homeController.delegate = self
        
        navigationController.viewControllers = [homeController]
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func pushToNext(row: UIViewController) {
        delegate?.pushToNext(row: row)
    }
}
