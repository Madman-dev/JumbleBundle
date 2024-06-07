//
//  CreateUserUsecase.swift
//  JumbleBundle
//
//  Created by Porori on 6/8/24.
//

import Foundation

// Use case
class UserRepository {
    private var users: [UUID: User] = [:]
    
    func save(_ user: User) {
        users[user.userId] = user
    }
    
    func findById(_ userId: UUID) -> User? {
        return users[userId]
    }
}

class CreateUser {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userData: [String: Any]) throws -> User {
        guard let id = userData["id"] as? UUID,
              let name = userData["name"] as? String,
              let email = userData["email"] as? String else {
            throw CreateUserError.invalidData
        }
        
        let user = User(userId: id, name: name, email: email)
        userRepository.save(user)
        return user
    }
}

enum CreateUserError: Error {
    case invalidData
}
