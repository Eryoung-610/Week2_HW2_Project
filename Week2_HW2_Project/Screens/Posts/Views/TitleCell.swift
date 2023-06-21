//
//  TitleCell.swift
//  Week2_HW2_Project
//
//  Created by Eric Young on 6/21/23.
//

import SwiftUI

struct TitleCell: View {
    let user : User
    
    var body: some View {
        HStack {
            Text("Title : ")
            Text(user.title)
            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

//struct TitleCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleCell()
//    }
//}
