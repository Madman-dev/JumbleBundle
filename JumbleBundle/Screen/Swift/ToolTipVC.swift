//
//  ToolTipVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/24/24.
//

import UIKit

class ToolTipVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let custom = ToolTipView(frame: .zero)
//        view.backgroundColor = .gray
        
        custom.backgroundColor = .blue
        
        self.view.addSubview(custom)
        NSLayoutConstraint.activate([
            custom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            custom.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            custom.heightAnchor.constraint(equalToConstant: 300),
            custom.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
