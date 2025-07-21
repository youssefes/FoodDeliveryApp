//
//  UserUtilites.swift
//  Created by Asset's Macbook Pro on 21/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
import CoreLocation
protocol UserUtilitesProtocol {
    static func onboarded() -> Bool
    static func saveOnbarding(Onbarding: Bool)
}

class UserUtilites: UserUtilitesProtocol {
    struct Keys {
        static let user = "user"
        static let onboarded = "onboarded"
    }

    static func isLogin() -> Bool {
       return getUser()?.id != nil
    }

    static func onboarded() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.onboarded)
    }
    
    static func saveOnbarding(Onbarding: Bool) {
        UserDefaults.standard.set(Onbarding, forKey: Keys.onboarded)
        UserDefaults.standard.synchronize()
    }

    // MARK: - save User
    static func saveUser(userDate : User){
        let userDefaults = UserDefaults.standard
        do {
            let encoder = JSONEncoder()
            let dataDefode = try encoder.encode(userDate)
            userDefaults.set(dataDefode, forKey: Keys.user)
            userDefaults.synchronize()

        } catch {
            print("Unable to Encode Note (\(error))")
        }
        userDefaults.synchronize()
    }

    // MARK: - get User
    static func getUser() -> User?{
        if let objects = UserDefaults.standard.value(forKey: Keys.user) as? Data {
            let decoder = JSONDecoder()
            let UserDate = try? decoder.decode(User.self, from: objects) as User
            return UserDate
        }
        return nil
    }
    // MARK: - delete User
    static func deleteUser(){
        UserDefaults.standard.removeObject(forKey: Keys.user)
        UserDefaults.standard.synchronize()
    }
}
