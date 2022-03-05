//
//  MocNetworkManager.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/4/22.
//  Copyright © 2022 mac. All rights reserved.
//

import Foundation
@testable import AbdoEl7aty

class MocNetworkManager: MenuControllerProtocol{
    
    var baseURL = ""
    var fileName: String?
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    static var orderItemsIds:MockOrderModel = MockOrderModel(){
        didSet {
            NotificationCenter.default.post(name:
                MenuController.orderUpdatedNotification, object: nil)
        }
    }
    
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func fetchCategories(completion: @escaping (Result<CategoriesResponse, Error>) -> Void) {
        
        guard let data = data(in: fileName) else {
            assertionFailure("unable to find the file with name \(fileName ?? "")")
            return
        }
        
        do {
            let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
            completion(.success(response))
        } catch let error {
            completion(.failure(OrderAppError.decodingError))
            print(error.localizedDescription)
        }
    }
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping (Result<MenuResponse, Error>) -> Void) {
        guard let data = data(in: fileName) else {
            assertionFailure("unable to find the file with name \(fileName ?? "")")
            return
        }
        
        do {
            let response = try JSONDecoder().decode(MenuResponse.self, from: data)
            completion(.success(response))
        } catch let error {
            completion(.failure(OrderAppError.decodingError))
            print(error.localizedDescription)
        }
    }
    
    func submitOrder(forMenuIDs menuIDs: [Int], completion: @escaping (Result<OrderResponse, Error>) -> Void) {
        guard let data = data(in: fileName) else {
            assertionFailure("unable to find the file with name \(fileName ?? "")")
            return
        }
        
        do {
            let response = try JSONDecoder().decode(OrderResponse.self, from: data)
            completion(.success(response))
        } catch let error {
            completion(.failure(OrderAppError.decodingError))
            print(error.localizedDescription)
        }
    }
    
    func addItem(itemID:MenuItem){
        MenuController.orderItemsIds.items.append(itemID)
    }
    func getItems()->[MenuItem]{
        return  MenuController.orderItemsIds.items
    }

    func removeItems(index:Int) {
        MenuController.orderItemsIds.items.remove(at: index)
    }
    
    func getOrderUpdateNotification()-> NSNotification.Name{
        return MenuController.orderUpdatedNotification
    }
    
    
    func data(in fileName: String? ) -> Data? {
        
        guard let path = Bundle(for: type(of: self))
            .url(forResource: fileName, withExtension: "json") else {
                assertionFailure("unable to find file name\(String(describing: fileName))")
                return nil
        }
        
        guard let data = try? Data(contentsOf: path) else {
            assertionFailure("unable to parse data")
            return nil
        }
        
        return data
        
    }
    
    enum OrderAppError : Error {
        case decodingError
    }
    
}
