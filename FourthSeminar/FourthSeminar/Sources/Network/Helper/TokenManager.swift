//
//  TokenManager.swift
//  FourthSeminar
//
//  Created by RAFA on 11/8/24.
//

import Foundation

final class TokenManager {

    static let shared = TokenManager()

    private init() { }

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: UserDefaults.authToken)
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaults.authToken)
    }

    func clearToken() {
        UserDefaults.standard.removeObject(forKey: UserDefaults.authToken)
    }

    func saveUsername(_ username: String) {
        UserDefaults.standard.set(username, forKey: UserDefaults.username)
    }
    
    func getUsername() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaults.username)
    }
}
