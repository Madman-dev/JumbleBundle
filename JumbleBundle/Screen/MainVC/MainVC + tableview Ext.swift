//
//  MainVC + Tableview Extension.swift
//  JumbleBundle
//
//  Created by Porori on 6/3/24.
//

import Foundation
import UIKit

extension MainVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = vcData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = vcData[indexPath.row].vc
        nextVC.title = vcData[indexPath.row].title
//        coordinator?.moveToSelectedRxTableView(nextVC)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
