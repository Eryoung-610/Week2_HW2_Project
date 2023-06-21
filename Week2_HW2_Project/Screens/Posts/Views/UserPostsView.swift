//
//  UserPostsView.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct UserPostsView: View {
    let posts: [User]
    let userId : Int
    
    var body: some View {
        ScrollView{
            ForEach(posts) { post in
                NavigationLink {
                    PostCell(user:post)
                } label : {
                    TitleCell(user: post)
                }
            }
            .navigationTitle("Posts by \(userId)")
        }
    }
    
}


//struct UserPostsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserPostsView(posts:mockData)
//    }
//}
