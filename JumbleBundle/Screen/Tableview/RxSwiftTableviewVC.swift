//
//  TableViewController.swift
//  JumbleBundle
//
//  Created by Porori on 6/3/24.
//

import UIKit

class RxSwiftTableviewVC: UITableViewController {

    private var vcData: [VCData] = [
        VCData(title: "Ch 2. Observing Observables", vc: RxObservingObservablesVC()),
        VCData(title: "Ch 2. Factory Observables", vc: FactoryObservableVC()),
        VCData(title: "Ch 2. Trait VC", vc: TraitsVC()),
        VCData(title: "Ch 2. Challenge", vc: Challenge()),
        VCData(title: "CH 3 Subjects", vc: Challenge()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let nextVC = vcData[indexPath.row].vc
        nextVC.title = vcData[indexPath.row].title
        self.navigationController?.pushViewController(nextVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
