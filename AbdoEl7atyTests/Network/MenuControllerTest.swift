//
//  MenuControllerTest.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class MenuControllerTest: XCTestCase {

    let item = MenuItem(id: 1, name: "Spaghetti and Meatballs", detailText: "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.", price: 9.0, category: "entrees", imageURL: nil)
    var sut: MenuControllerProtocol?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MenuController.shared
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSut_fetchCategory() {
        sut?.fetchCategories(completion: { ( result: Result<CategoriesResponse, Error>) in
            XCTAssertNotNil(result)
        })
    }
    
    func testSut_fetchMenuItems() {
        sut?.fetchMenuItems(forCategory: "entrees", completion: { (result) in
            XCTAssertNotNil(result)
        })
    }
    
    func testSut_submitOrder() {
        sut?.submitOrder(forMenuIDs: [1], completion: { (result) in
            XCTAssertNotNil(result)
        })
    }

    func testSut_WhenAddItemIsCalled() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut?.addItem(itemID: item)
        XCTAssertNotEqual(MenuController.orderItemsIds.items.count, 0)
    }
    
    func testSut_WhenGetItemIsCalled() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let items = sut?.getItems()
        XCTAssertNotNil(items)
    }
    
    func testSut_WhenRemoveItemIsCalled() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut?.addItem(itemID: item)
        XCTAssertNotEqual(MenuController.orderItemsIds.items.count, 0)
        let count = MenuController.orderItemsIds.items.count
        sut?.removeItems(index: 0)
        XCTAssertNotEqual(MenuController.orderItemsIds.items.count, count)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
