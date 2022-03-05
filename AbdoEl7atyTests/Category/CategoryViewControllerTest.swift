//
//  CategoryViewController.swift
//  AbdoEl7atyTests
//
//  Created by mac on 3/4/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class CategoryViewControllerTest: XCTestCase {
    
    var sut: CategoriesTableViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CategoriesTableViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSut_tableViewDelegateIsSet() {
        // This is an example of a functional test case.
        XCTAssertNotNil(sut?.tableView.delegate)
    }
    
    func testSut_tableViewDatasourceIsSet() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(sut?.tableView.dataSource)
    }
    
    func testSut_presenterIsSet() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.presenter)
    }
    
    func testSut_startWithemptyTableViewcells() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    func testSut_whenLoadTableView_isFilled() {
        
        sut = CategoriesTableViewController()
        let presenter = MocCategoryPresenter()
        sut.loadViewIfNeeded()
        sut.presenter = presenter
        sut.reloadTableData()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), presenter.getResultCount())
    }
    
    func testSut_whenCellForRowIsCalled_cellsReturnedWithData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "CategoriesTableViewController") as? CategoriesTableViewController
        sut.loadViewIfNeeded()
        sut.presenter = MocCategoryPresenter()
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text ?? "", "Desserts")
    }
    
    func testSut_whenNavigateToMenuItem() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "CategoriesTableViewController") as? CategoriesTableViewController
        sut.loadViewIfNeeded()
        sut.presenter = MocCategoryPresenter()
        let window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()

        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        sut.navigationController?.pushViewController(MenuItemsTableViewController(), animated: false)
        RunLoop.current.run(until: Date())
        XCTAssertNotNil(sut.navigationController?.topViewController as? MenuItemsTableViewController)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}



