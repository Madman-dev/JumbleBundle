//
//  CleanArchitectureTableView.swift
//  JumbleBundle
//
//  Created by Porori on 6/7/24.
//

import UIKit

class CleanArchitectureTableView: UITableViewController {
    
    weak var coordinator: BaseCoordinator?
    let vcData = [
        VCData(title: "Clean Architecture", vc: CleanArchVC()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("CleanArchitectureTableView에서 child 갯수는: ", coordinator?.childCoordinator.count)
        print("CleanArchitectureTableView에서 navigation 갯수는: ", coordinator?.navigationController.viewControllers.count)
    }
    
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
