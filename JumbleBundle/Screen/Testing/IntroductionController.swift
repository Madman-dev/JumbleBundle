//
//  IntroductionController.swift
//  JumbleBundle
//
//  Created by Porori on 6/11/24.
//

import UIKit

class IntroductionController: UIViewController {
    var onLogin: (() -> Void)?
    var onRegister: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    @objc func loginTapped() {
        self.onLogin?()
    }
    
    @objc func registerTapped() {
        self.onRegister?()
    }
}
