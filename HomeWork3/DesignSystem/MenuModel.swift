//
//  MenuModel.swift
//  HomeWork3
//
//  Created by Бексултан Мусаев on 24/5/23.
//

import SwiftUI

struct MenuModel: Hashable {
    var image: Image
    var title: String
    var descriptionMenu: String
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(descriptionMenu)
      
    }
    
    static func == (lhs: MenuModel, rhs: MenuModel) -> Bool {
        return lhs.title == rhs.title &&
            lhs.descriptionMenu == rhs.descriptionMenu
    }
}


