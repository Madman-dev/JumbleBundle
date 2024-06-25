//
//  SwiftTableVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/21/24.
//

import UIKit

class SwiftTableVC: UITableViewController {

    private var vcData: [VCData] = [
        VCData(title: "Singleton test", vc: SingletonTestVC()),
        VCData(title: "Font test", vc: FontTestVC()),
        VCData(title: "Color test", vc: ColorTest()),
        VCData(title: "ToolTip test", vc: ToolTipVC())
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
