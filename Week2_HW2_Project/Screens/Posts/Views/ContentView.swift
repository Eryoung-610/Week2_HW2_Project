//
//  ContentView.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Posts By Users")
                    .font(.system(size: 32).bold())
                byUserId()
            }
            .onAppear {
                viewModel.getUsers()
            }
        }
        .padding()
    }
    
    private func byUserId() -> some View {
        ScrollView {
            ForEach(viewModel.groupedUsers.keys.sorted(), id: \.self) { userId in
                NavigationLink(destination: UserPostsView(posts: viewModel.groupedUsers[userId] ?? [])) {
                    UserCell(user: viewModel.groupedUsers[userId]?.first ?? User.mock)
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
