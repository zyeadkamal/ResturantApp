//
//  MocCategoryPresenter.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
@testable import AbdoEl7aty
class MocCategoryPresenter: CategoriesPresenterToCategoriesController {
    
    var result : [String] = ["Desserts", "Entrées", "Beverages"]
    
    func getResult() -> [String]? {
        return result
    }
    
    func getResultCount() -> Int {
        return result.count
    }
    
    func getCategoriesAtIndexPath(at: Int) -> String {
        return result[at]
    }
    
}
