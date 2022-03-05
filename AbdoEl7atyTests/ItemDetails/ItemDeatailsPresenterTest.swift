//
//  ItemDeatailsPresenterTest.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class ItemDeatailsPresenterTest: XCTestCase {
    
    private var sut: ItemDetailsPresenter!
    var view: ItemDetailsViewController!
    let item = MenuItem(id: 1, name: "Spaghetti and Meatballs", detailText: "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.", price: 9.0, category: "entrees", imageURL: nil)
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = ItemDetailsViewController()
        sut = ItemDetailsPresenter(item: item, view: view)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        view = nil
    }
    
    func testSut_itemIsSetted() {
        
        XCTAssertNotNil(sut.item)
    }
    
    func testSut_viewIsSetted() {
        
        XCTAssertNotNil(sut.view)
    }
    
    func testSut_menuControllerIsSetted() {
        
        XCTAssertNotNil(sut.menuControllerProtocol)
    }
    
    func testSut_whenGetItemIsCalled_itemIsReturned() {
           
        let itemTest = sut.getItem()
        XCTAssertNotNil(itemTest)
    }
    
    func testSut_whenAddItemIsCalled_itemArraycountIsIncrease() {
           
        sut.addItem()
        XCTAssertNotEqual(MenuController.orderItemsIds.items.count, 0)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
