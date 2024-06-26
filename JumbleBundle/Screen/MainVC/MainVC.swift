//
//  MainVC.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()
    var vcData: [VCData] = [
        VCData(title: "Swift", vc: SwiftTableVC()),
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
