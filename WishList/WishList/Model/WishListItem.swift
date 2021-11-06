//
//  WishListItem.swift
//  WishList
//
//  Created by Claudia Maciel on 11/5/21.
//

import Foundation
import UIKit

struct WishListItem: Identifiable, Decodable {
    var id = UUID()
    let title: String
    let description: String
    let image: String
    
    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
}
