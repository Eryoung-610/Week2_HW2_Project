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
    
    var cancellable = Set<AnyCancellable>()
    let service = UserService()
    
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
            }
            .store(in: &cancellable)
    }
}
