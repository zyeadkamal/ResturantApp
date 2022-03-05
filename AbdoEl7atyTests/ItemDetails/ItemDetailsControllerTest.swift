//
//  ItemDetailsControllerTest.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class ItemDetailsControllerTest: XCTestCase {

    var sut: ItemDetailsViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ItemDetailsViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSut_whenSetPresenterIscalled() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let presenter = MocItemdetails()
        sut.setPresenter(presenter: presenter)
        XCTAssertNotNil(sut.presenter)
    }
    
    func testSut_whenViewDidLoadIsCalled_itemPriceLabelIsSetted() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ItemDetailsViewController") as? ItemDetailsViewController        
        let presenter = MocItemdetails()
        sut.setPresenter(presenter: presenter)
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.itemPriceLabel.text, "$9.0")
    }
    
    func testSut_whenViewDidLoadIsCalled_itemNameLabelIsSetted() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ItemDetailsViewController") as? ItemDetailsViewController
        let presenter = MocItemdetails()
        sut.setPresenter(presenter: presenter)
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.itemNameLabel.text, "Spaghetti and Meatballs")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
