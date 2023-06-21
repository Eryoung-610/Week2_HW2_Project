//
//  UserPostsView.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct UserPostsView: View {
    let posts: [User]
    
    var body: some View {
        ScrollView{
            ForEach(posts) { post in
                UserCell(user: post)
            }
            //        .padding()
            .navigationTitle("Posts")
            //        .foregroundColor(.black)
            //        .background(Color.blue.opacity(0.2))
            //        .cornerRadius(10)
        }
    }
    
}


//struct UserPostsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserPostsView(posts:mockData)
//    }
//}
