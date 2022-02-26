//
//  AbdoEl7atyTests.swift
//  AbdoEl7atyTests
//
//  Created by mac on 2/26/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class AbdoEl7atyTests: XCTestCase {

    let menuCrt: MenuControllerProtocol = MenuController.shared
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testCategoriesAPI() throws {
       let exception = expectation(description: "Time out")

       menuCrt.fetchCategories { (result) in
           switch result{
           case .success(let categories):
               XCTAssertNotNil(categories)
               exception.fulfill()
           case .failure(_):
               XCTFail()
           }
       }
           waitForExpectations(timeout: 10, handler: nil)
   }
   
   func testMenuItemsAPI() throws {
       let exception = expectation(description: "Time out")

       menuCrt.fetchMenuItems(forCategory: "salads") { (result) in
           switch result{
           case .success(let menus):
               XCTAssertNotNil(menus)
               exception.fulfill()
           case .failure(_):
               XCTFail()
           }
       }
           waitForExpectations(timeout: 10, handler: nil)
       
   }
    
    
   func testSubmitAPI() throws {
       let exception = expectation(description: "Time out")
       
       menuCrt.submitOrder(forMenuIDs: [1,2]){ (result) in
           switch result{
           case .success(let time):
               XCTAssertNotNil(time)
               exception.fulfill()
           case .failure(_):
               XCTFail()
           }
       }
           waitForExpectations(timeout: 10, handler: nil)
       
   }

}
