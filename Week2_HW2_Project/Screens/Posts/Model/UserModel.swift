//
//  UserModel.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import Foundation

struct User: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var totalCount: Int {
        return User.calculateTotalCount(for: userId)
    }
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
    static var fetchedData: [User] = []
    
    static let mock = User(userId: 1, id: 1, title: "Test Title", body: "Test Body")
    
    static func calculateTotalCount(for userId: Int) -> Int {
        let allUsers = User.fetchedData
        return allUsers.filter { $0.userId == userId }.count
    }
}
