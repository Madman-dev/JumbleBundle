//
//  SocialTest.swift
//  JumbleBundle
//
//  Created by Porori on 6/15/24.
//

import Foundation
import UIKit
import Security

class SocialTest: UIViewController {
    
    let idTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.attributedPlaceholder = NSAttributedString(
            string: "아이디를 입력하세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue]
        )
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.blue.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let pwTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .red
        tf.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력하세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
        )
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryFetchData()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(pwTextField)
        view.addSubview(idTextField)
        pwTextField.delegate = self
        idTextField.delegate = self
        
        NSLayoutConstraint.activate([
            idTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idTextField.widthAnchor.constraint(equalToConstant: 150),
            idTextField.heightAnchor.constraint(equalToConstant: 50),
            
            pwTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pwTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pwTextField.widthAnchor.constraint(equalToConstant: 200),
            pwTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func tryStorePassword(withText pw: String) {
        do {
            print("비밀번호는 \(pw)")
            try KeychainManager.storePassword(of: pw)
            print("비밀번호가 저장되었습니다.")
        } catch {
            print("데이터가 없습니다.")
        }
    }
    
    private func tryFetchData() {
        do {
            print("데이터를 가져옵니다.")
            let passwordData = try KeychainManager.retreiveData()
            if let myPassword = String(data: passwordData, encoding: .utf8) {
                print("저장되어 있는 데이터는, \(myPassword)입니다")
            } else {
                print("변형할 수 있는 데이터가 없습니다")
            }
        } catch {
            print("선택된 데이터를 발견할 수 없습니다.")
        }
    }
}

class KeychainManager {
    enum KeychainError: Error {
        case unknownData(OSStatus)
        case duplicateItem(String)
        case noData(String)
    }
    
    static func storePassword(of password: String, forKey user: String = "myEmail@gmail.com") throws {
        let passwordData = password.data(using: .utf8)
        // dictionary that holds the keychain informations
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecValueData as String: passwordData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            throw KeychainError.duplicateItem("데이터가 이미 있습니다.")
        } else if status != errSecSuccess {
            throw KeychainError.unknownData(status)
        }
    }
    
    static func retreiveData(for user: String = "myEmail@gmail.com") throws -> Data {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecItemNotFound {
            throw KeychainError.noData("데이터가 없습니다.")
        } else if status != errSecSuccess {
            throw KeychainError.unknownData(status)
        }
        
        guard let data = item as? Data else {
            throw KeychainError.unknownData(status)
        }
        
        print(data)
        return data
    }
}

extension SocialTest: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            tryStorePassword(withText: text)
        }
    }
}
