//
//  UserEntity.swift
//  JumbleBundle
//
//  Created by Porori on 6/8/24.
//

import Foundation

// Entity
class User {
    let userId: UUID
    var name: String
    var email: String
    
    init(userId: UUID, name: String, email: String) {
        self.userId = userId
        self.name = name
        self.email = email
    }
    
    func changeEmail(newEmail: String) throws {
        guard isValidEmail(newEmail) else {
            throw UserError.invalidEmail
        }
        self.email = newEmail
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Implement email validation logic here
        return email.contains("@")
    }
}

enum UserError: Error {
    case invalidEmail
}
