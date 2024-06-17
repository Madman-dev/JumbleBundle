//
//  MainVC.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

protocol HomeViewControllerDelegate {
    func pushToNextScreen()
}

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegate: HomeViewControllerDelegate?
    var tableView = UITableView()
    var vcData: [VCData] = [
        VCData(title: "RxSwift", vc: RxSwiftTableviewVC()),
        VCData(title: "CA", vc: CleanArchitectureTableView())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addTableview()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
//        print("main에서 child 갯수는: ",coordinator?.childCoordinator.count)
//        print("main에서 navigation 갯수는: ",coordinator?.navigationController.viewControllers.count)
    }
    
    func setup() {
        title = "What I've studied"
    }
    
    func addTableview() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.frame
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
