//
//  FontTestVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/23/24.
//

import Foundation
import UIKit

class FontTestVC: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "테스팅 폰트 적용"
        label.font = .KorFont.bold(size: ._12).name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setup()
    }
    
    private func setup() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
