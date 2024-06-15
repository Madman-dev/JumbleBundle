//
//  LoginCoordinator.swift
//  JumbleBundle
//
//  Created by Porori on 6/11/24.
//

import UIKit

//class LoginCoordinator {
//    var window: UIWindow
//    
//    var navigationController: UINavigationController?
//    private var intialController: UIViewController? {
//        didSet {
//            if let initialController = intialController {
//                navigationController = UINavigationController(rootViewController: initialController)
//                self.window.rootViewController = navigationController
//            }
//        }
//    }
//    
//    init(window: UIWindow) {
//        self.window = window
//    }
//    
//    func start() {
//        open()
//    }
//    
//    func open() {
//        let introductionController = IntroductionController()
//        self.intialController = introductionController
//        introductionController.onLogin = {
//            self.openPhoneConfirmation { isConfirmed in
//                if isConfirmed {
//                    print("메인 화면 오픈")
//                }
//            }
//        }
//        
//        introductionController.onRegister = {
//            self.openPhoneConfirmation { isConfirmed in
//                if isConfirmed {
//                    print("회원 가입 페이지 오픈")
//                }
//            }
//        }
//    }
//    
//    func openPhoneConfirmation(confirmed: @escaping (Bool) -> Void) {
//        let confirmationController = PhoneConfirmationController()
//        confirmationController.onConfirm = { isConfirmed in
//            confirmed(isConfirmed)
//        }
//        
//        self.navigationController?.pushViewController(confirmationController, animated: true)
//    }
//    
//    func openRegister() {
//        let registerController = RegisterController()
//        self.navigationController?.pushViewController(registerController, animated: true)
//    }
//    
//    func openMainPage() {
//        let mainPage = MainPageController()
//        self.navigationController?.pushViewController(mainPage
//                                                      , animated: true)
//    }
//}
