//
//  UserCell.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct UserCell: View {
    
    let user : User
    
    var body: some View {
        HStack {
                HStack {
                    Text(String(user.userId))
                        .padding(.bottom,40)
                }
            VStack(alignment: .leading) {
                Text(String(user.id))
                    .bold()
//                Text(user.title)
//                Text(user.body)
                Text(String(user.totalCount))
                
            }
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user:User.mock)
    }
}
