//
//  Coordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/9/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinator: [Coordinator] { get set }
    
    func start()
}
