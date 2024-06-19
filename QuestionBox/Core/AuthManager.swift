//
//  AuthManager.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 19.06.2024.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()

    private init() {}

    var menuType: SettingsMenuType = .notPremiumAccount
}
