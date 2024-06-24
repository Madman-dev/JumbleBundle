//
//  ColorTest.swift
//  JumbleBundle
//
//  Created by Porori on 6/23/24.
//

import UIKit

class ColorTest: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "테스팅 폰트 적용"
        label.font = .KorFont.bold(size: ._32).name
        label.textColor = UIColor.blu700
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
