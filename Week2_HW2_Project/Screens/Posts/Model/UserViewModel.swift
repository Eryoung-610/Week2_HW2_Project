//
//  UserViewModel.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import Foundation
import Combine
import SwiftUI

class UserViewModel : ObservableObject {
    @Published var users = [User]()
    @Published var groupedUsers: [Int: [User]] = [:]
    
    var cancellable = Set<AnyCancellable>()
    let service = UserService()
    
    let mockData: [User] = [
        User(userId: 1, id: 1, title: "Post 1", body: "This is the body of post 1."),
        User(userId: 1, id: 2, title: "Post 2", body: "This is the body of post 2."),
        User(userId: 2, id: 3, title: "Post 3", body: "This is the body of post 3."),
        User(userId: 2, id: 4, title: "Post 4", body: "This is the body of post 4."),
        User(userId: 3, id: 5, title: "Post 5", body: "This is the body of post 5.")
    ]
    
    func getUsers() {
        service.fetchUsers()
            .sink { completion in
                switch completion {
                case .finished :
                    break
                case .failure(let err) :
                    print(err.localizedDescription)
                }
            } receiveValue: { users in
                self.users = users
                self.groupedUsers = Dictionary(grouping: users, by: { $0.userId })
            }
            .store(in: &cancellable)
    }
    
    
}
