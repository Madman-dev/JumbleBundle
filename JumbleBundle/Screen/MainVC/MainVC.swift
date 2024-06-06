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
        VCData(title: "RxSwift", vc: RxSwiftTableviewVC())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addTableview()
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