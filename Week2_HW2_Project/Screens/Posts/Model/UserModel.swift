//
//  UserModel.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import Foundation

struct UserResponse : Decodable {
    let user : [User]
    
    static let mock = UserResponse(user: [User.mock])
}

struct User : Decodable, Identifiable {
    let userId: Int
    let id : Int
    let title : String
    let body : String
    
    enum CodingKeys : String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
    static let mock = User(userId: 1, id: 1, title: "Test Title", body: "Test Body")
}
