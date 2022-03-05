//
//  MenuItemsViewControllerTest.swift
//  AbdoEl7atyTests
//
//  Created by Sarah Nassrat  on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class MenuItemsViewControllerTest: XCTestCase {

    var sut:MenuItemsTableViewController!
    
    override func setUp() {
        super.setUp()
        sut = MenuItemsTableViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSUT_ShouldSetTableViewDelegate() {
      
      XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testSUT_ShouldSetTableViewDatasource() {
      
      XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testSut_whenViewDidLoadCalled_menuItemsPresenterIsSet() {
        // When
        sut.loadViewIfNeeded()
        sut.setPresenter(presenter: MockMenuItemsPresenter())
        
        // Then
        XCTAssertNotNil(sut.presenter)
    }
    
    func testSut_startsWithEmptyTableView() {
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func testSut_whenGetMenuItemsAndReloadTableIsCalled_tableViewIsFilled() {
        let presenter = MockMenuItemsPresenter()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
        sut.reloadTableData()
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), presenter.menuItems.count)
    }
    
    func testSut_whenCellForRowIsCalled_cellIsReturnedWithCorrectData() {
        // Given
        
        // To register the cell with the table view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MenuItemsTableViewController") as? MenuItemsTableViewController
        sut.loadViewIfNeeded()
        
        sut.setPresenter(presenter: MockMenuItemsPresenter())
        sut.presenter?.loadMenuItems()

        
        // When
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? MenuItemTableViewCell
        
        // Then
        XCTAssertEqual(cell?.itemNameLabel.text, "Spaghetti and Meatballs")
    }
    
//    func testSut_whenNavigateToMenuItem() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        sut = storyboard.instantiateViewController(identifier: "MenuItemsTableViewController") as? MenuItemsTableViewController
//        sut.loadViewIfNeeded()
//        sut.presenter = MockMenuItemsPresenter()
//        let window = UIWindow()
//        window.rootViewController = UINavigationController(rootViewController: sut)
//        sut.loadViewIfNeeded()
//
//        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
//        sut.navigationController?.pushViewController(ItemDetailsViewController(), animated: false)
//        RunLoop.current.run(until: Date())
//        XCTAssertNotNil(sut.navigationController?.topViewController as? ItemDetailsViewController)
//    }

}


class MockMenuItemsPresenter: MenuItemsPreseterProtocols {
    var networkManager = MenuItemPresenter(categoryName:"entrees",view:MenuItemsTableViewController(),menuController:MocNetworkManager(fileName:""))
    var menuItems : [MenuItem] = []

    func loadMenuItems() {
        menuItems = [MenuItem.init(id: 1, name: "Spaghetti and Meatballs", detailText: "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.", price: 9, category: "entrees", imageURL:URL(fileURLWithPath:"http://localhost:8080/images/1.png")),MenuItem(id: 2, name: "Margherita Pizza", detailText: "Tomato sauce, fresh mozzarella, basil, and extra-virgin olive oil.", price: 10, category: "entrees", imageURL:URL(fileURLWithPath:"http://localhost:8080/images/2.png"))]
    }
    
    func getMenuItemsCount() -> Int {
        return menuItems.count
    }
    
    func getMenuitemAtIndex(indexPath: Int) -> MenuItem? {
        return indexPath < menuItems.count ? menuItems[indexPath] : nil
    }
    
}
