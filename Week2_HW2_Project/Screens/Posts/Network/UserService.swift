//
//  UserService.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import Foundation
import Combine
import SwiftUI

class UserService {
    var cancellable = Set<AnyCancellable>()
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchUsers() -> Future<[User], Error> {
        
        return Future { [weak self] promise in
            guard let self = self else { return }
            
            guard let url = URL(string: self.urlString) else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTaskPublisher(for: url)
                .map{$0.data}
                .decode(type:[User].self, decoder:JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err) :
                        promise(.failure(err))
                    }
                } receiveValue : { users in
                    User.fetchedData = users
                    promise(.success(users))
//                    print("Received Users: \(response.user)")
                }
                .store(in : &self.cancellable)
        }
    }
}
