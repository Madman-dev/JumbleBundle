//
//  ToastMessage.swift
//  JumbleBundle
//
//  Created by Porori on 6/23/24.
//

import Foundation
import UIKit

class ToastMessage: UIView {
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = "이것도???"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(message: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupToast()
        changeMessage(message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupToast() {
        self.addSubview(backView)
        backView.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backView.widthAnchor.constraint(equalToConstant: 150),
            backView.heightAnchor.constraint(equalToConstant: 30),
            
            messageLabel.topAnchor.constraint(equalTo: backView.topAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
        ])
    }
    
    private func changeMessage(_ message: String) {
        messageLabel.text = message
    }
}
