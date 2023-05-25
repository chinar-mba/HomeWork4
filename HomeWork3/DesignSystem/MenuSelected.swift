//
//  MenuSelected.swift
//  HomeWork3
//
//  Created by Chinara on 5/23/23.
//

import SwiftUI
import Kingfisher

struct MenuSelected: View {
    var image: KFImage
    var title: String
    var descriptionMenu: String
   
    
    var body: some View {
        VStack {
            image
                .resizable()
               .frame(width: 150, height: 150)
             .aspectRatio(contentMode: .fit)
             .clipShape(Circle())
             .overlay(Circle().stroke(Color.white, lineWidth: 2))
        
            
            CustomTextView(title: title, fontSize: 16, isBold: true, textColor: .black)
            CustomTextView(title: descriptionMenu, fontSize: 10, isBold: true, textColor: .gray)
                .lineLimit(1)
                .frame(width: 100, height: 100)
            Spacer()
            
        }
    }
}
 
    struct MenuSelected_Previews: PreviewProvider {
        static var previews: some View {
            MenuSelected(image: .init(URL(string: "")), title:.init(), descriptionMenu: .init())
        }
    }


