//
//  File.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 12.09.2022.
//

import Foundation

public struct MedicalUser: Codable, Equatable {
    public var userName: String
    public var email: String
    public var rules: String
    public var userID: String
    public var icon: String
    
    public init(userName: String, email: String, rules: String, userID: String, icon: String) {
        self.userName = userName
        self.email = email
        self.rules = rules
        self.userID = userID
        self.icon = icon
    }
    
}

public enum Rules: String, Codable {
    case user
    case moderator
    case admin
}
