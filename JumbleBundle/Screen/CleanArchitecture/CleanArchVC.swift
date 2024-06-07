//
//  CleanArchVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/7/24.
//

import UIKit

class CleanArchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        creatingNewUser()
    }
    
    func creatingNewUser() {
        let userRepository = UserRepository()
        let createUser = CreateUser(userRepository: userRepository)
        
        let userData: [String: Any] = [
            "id": UUID(),
            "name": "jack",
            "email": "jackleejacklee"
        ]
        
        do {
            let newUser = try createUser.execute(userData: userData)
            print("새로운 사용자가 생성되었습니다.")
            print(newUser.name)
        } catch {
            print("데이터 생성 오류 발생")
        }
    }
}
