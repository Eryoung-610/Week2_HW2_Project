//
//  PostCell.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct PostCell: View {
    let user : User
    
    var body: some View {
        VStack{
            Text(user.title)
                .padding(.top,20)
                .font(.system(size: 32).bold())
            
            Text(user.body)
                .padding(.top,30)
            Spacer()
        }
        .padding()
    }
}

//struct PostCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCell()
//    }
//}
