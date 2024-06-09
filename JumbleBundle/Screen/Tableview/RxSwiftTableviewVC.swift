//
//  TableViewController.swift
//  JumbleBundle
//
//  Created by Porori on 6/3/24.
//

import UIKit

class RxSwiftTableviewVC: UITableViewController {

    weak var coordinator: RxSwiftCoordinator?
    private var vcData: [VCData] = [
        VCData(title: "Ch 1. Observing Observables", vc: RxObservingObservablesVC()),
        VCData(title: "Ch 1. Factory Observables", vc: FactoryObservableVC()),
        VCData(title: "Ch 1. Trait VC", vc: TraitsVC())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("rxSwift에서 child 갯수는: ", coordinator?.childCoordinator.count)
        print("rxSwift에서 navigation 갯수는: ", coordinator?.navigationController.viewControllers.count)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didTapBack()
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
        
        coordinator?.pushToViewController(nextVC)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
