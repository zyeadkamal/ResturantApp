//
//  MocItemDetails.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
@testable import AbdoEl7aty

class MocItemdetails: ItemDetailsPresenterController {
    
    var item : MenuItem = MenuItem(id: 1, name: "Spaghetti and Meatballs", detailText: "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.", price: 9.0, category: "entrees", imageURL: nil)
    
    func getItem() -> MenuItem {
        return item
    }
    
    func addItem() {
        
    }
    
    
}
