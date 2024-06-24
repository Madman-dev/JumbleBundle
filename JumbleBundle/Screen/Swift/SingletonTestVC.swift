//
//  BasicsVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/21/24.
//

import Foundation
import UIKit

class SingletonTestVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // 싱글톤
        
        // 싱글톤으로 호출하게 되면 호출이 된 이후 되돌아가면 사라진다
        // Singleton.shared.createToast(superview: view, withMessage: "이런 메시지")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        // 싱글톤으로 호출하게 되면 호출이 된 이후 되돌아가면 사라진다
//        Singleton.shared.createToast(superview: view, withMessage: "이런 메시지")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 나의 가설은 계속 호출이 된다. 하지만 어찌됐던 이전 화면으로 되돌아가면 사라진다?
        // 가설 실패! > 이 이유를 생각해보자
//         Singleton.shared.createToast(superview: view, withMessage: "이런 메시지")
        
        // 아래 코드는 매번 호출이 된다.
//        ToastMessenger.showToast(message: "이런 메시지가 나와요", in: self)
    }
}

// 싱글톤은 concurrent한 상황에서 발생할 수 있는 문제점이 있다.
// concurrency를 해결하는 방법으로 대체 방안이 필요해보인다
//class Singleton {
//    static let shared = Singleton()
//    private init() {}
//    
//    private let messageLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.backgroundColor = .gray
//        label.textColor = .black
//        label.text = "이것도???"
//        label.layer.cornerRadius = 5
//        label.clipsToBounds = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    func setupToast(to superview: UIView) {
//        superview.addSubview(messageLabel)
//        
//        NSLayoutConstraint.activate([
//            
//            messageLabel.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
//            messageLabel.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -50),
//            messageLabel.widthAnchor.constraint(equalToConstant: 150),
//            messageLabel.heightAnchor.constraint(equalToConstant: 30)
//        ])
//    }
//    
//    func updateMessage(_ message: String) {
//        self.messageLabel.text = message
//    }
//    
//    func createToast(superview: UIView, withMessage: String) {
//        print("싱글톤 생성 완료")
//        
//        DispatchQueue.main.async {
//            self.setupToast(to: superview)
//            self.updateMessage(withMessage)
//        
//        
//            UIView.animate(withDuration: 4,
//                           delay: 3,
//                           options: .curveEaseOut
//            ) {
//                self.messageLabel.alpha = 0
//            } completion: { complete in
//                self.messageLabel.removeFromSuperview()
//            }
//        }
//    }
//}

//class ToastMessenger {
//    // 이 친구는 잘 된다
//    static func showToast(message: String, in viewController: UIViewController) {
//            DispatchQueue.main.async {
//                let toastLabel = UILabel()
//                toastLabel.text = message
//                toastLabel.textAlignment = .center
//                toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//                toastLabel.textColor = UIColor.white
//                toastLabel.alpha = 1.0
//                toastLabel.layer.cornerRadius = 10
//                toastLabel.clipsToBounds = true
//                
//                let maxSizeTitle = CGSize(width: viewController.view.bounds.size.width - 40, height: viewController.view.bounds.size.height)
//                var expectedSizeTitle = toastLabel.sizeThatFits(maxSizeTitle)
//                expectedSizeTitle = CGSize(width: min(maxSizeTitle.width, expectedSizeTitle.width), height: min(maxSizeTitle.height, expectedSizeTitle.height))
//                toastLabel.frame = CGRect(x: (viewController.view.frame.size.width - expectedSizeTitle.width) / 2,
//                                          y: viewController.view.frame.size.height - 100,
//                                          width: expectedSizeTitle.width + 20,
//                                          height: expectedSizeTitle.height + 10)
//                
//                viewController.view.addSubview(toastLabel)
//                
//                UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
//                    toastLabel.alpha = 0.0
//                }, completion: { _ in
//                    toastLabel.removeFromSuperview()
//                })
//            }
//        }
//}

/// 하지만 화면 전환이 이뤄지면 사라진다...
extension UIViewController {
    func showMessage(message: String) {
        let messageLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.backgroundColor = .gray
            label.textColor = .black
            label.text = "이것도???"
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
    }
}
