//
//  CategoryPresenter.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/4/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class CategoryPresenterTest: XCTestCase {

    private var sut:CategoriesPresenter!
    private var categoryView: CategoriesTableViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        categoryView = CategoriesTableViewController()
        sut = CategoriesPresenter(view: categoryView)
    }

    override func tearDown() {
        sut = nil
        categoryView = nil
    }

    
    func testSut_whenInitCalled_categoryViewIsSet() {
                
        XCTAssertNotNil(sut.view)
        
    }
    
    func testSut_whenLoadResultCalled_resultAreFilled() {
        
        sut = CategoriesPresenter(view: categoryView, menuController: MocNetworkManager(fileName: "Categories"))
                
        XCTAssertNotEqual(sut.result, [])
        
        
    }
    
    func testSut_whenGetResultCountCalled_resultAreFilledWith3() {
        
        sut = CategoriesPresenter(view: categoryView, menuController: MocNetworkManager(fileName: "Categories"))
        
        let resultCount = sut.getResultCount()
        
        XCTAssertEqual(resultCount, 3)
        
        
    }

    
    func testSut_whenGetCategoriesAtIndexPathCalled_resultAreReturned() {
        
        sut = CategoriesPresenter(view: categoryView, menuController: MocNetworkManager(fileName: "Categories"))
        
        let resultAtIndex = sut.getCategoriesAtIndexPath(at:0)
        
        XCTAssertEqual(resultAtIndex, "Desserts")
        
        
    }
    
    func testSut_whenLoadResultCalledWithFailure_resultStillEmpty() {
        
        sut = CategoriesPresenter(view: categoryView, menuController: MocNetworkManager(fileName: "Error"))
                
        XCTAssertEqual(sut.result, [])
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
