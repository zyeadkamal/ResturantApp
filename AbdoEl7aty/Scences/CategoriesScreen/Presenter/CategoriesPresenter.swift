//
//  CategoriesPresenter.swift
//  AbdoEl7aty
//
//  Created by mac on 2/25/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation

protocol CategoriesPresenterToCategoriesController : AnyObject {
    
    func getResult() -> [String]?
    func getResultCount() -> Int
    func getCategoriesAtIndexPath(at: Int) -> String
}

class CategoriesPresenter: CategoriesPresenterToCategoriesController{
    
     var result : [String]? = []
     weak var view : CategoriesControllerToPresenter?
     var menuController : MenuControllerProtocol
    
    init(view: CategoriesControllerToPresenter,
         menuController: MenuControllerProtocol = MenuController.shared) {
        
        self.view = view
        self.menuController = menuController
        loadData()
    }
    
    func loadData(){
        menuController.fetchCategories { [weak self] (result : Result<CategoriesResponse, Error>) in
            
            switch result{
            case .success(let response):
                self?.result = response.categories
                DispatchQueue.main.async {
                    self?.view?.reloadTableData()
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func getResult() -> [String]? {
        return self.result
    }
    
    func getResultCount() -> Int {
        return self.result?.count ?? 0
    }
    
    func getCategoriesAtIndexPath(at: Int) -> String{
        return result?[at] ?? ""
    }
    
}
