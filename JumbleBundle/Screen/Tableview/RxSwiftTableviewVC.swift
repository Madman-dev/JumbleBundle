//
//  TableViewController.swift
//  JumbleBundle
//
//  Created by Porori on 6/3/24.
//

import UIKit

class RxSwiftTableviewVC: UITableViewController {

    private var vcData: [VCData] = [
        VCData(title: "Ch 1. Observing Observables", vc: RxObservingObservablesVC()),
        VCData(title: "Ch 1. Factory Observables", vc: FactoryObservableVC())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = vcData[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = vcData[indexPath.row].vc
        vc.title = vcData[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
