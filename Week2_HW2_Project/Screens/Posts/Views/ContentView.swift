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
        NavigationView{
            VStack {
                Text("All Users")
                    .font(.system(size:32).bold())
                byUserId()
            }
            .onAppear {
                viewModel.getUsers()
            }
        }
    }
    
    
    private func byUserId() -> some View {
        ScrollView {
            ForEach (viewModel.users) { user in
                NavigationLink {
                    Text(String(user.userId))
                } label : {
                    UserCell(user:user)
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
