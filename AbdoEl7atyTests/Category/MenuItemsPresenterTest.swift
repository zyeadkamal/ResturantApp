//
//  MenuItemsPresenterTest.swift
//  AbdoEl7atyTests
//
//  Created by Sarah Nassrat  on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class MenuItemsPresenterTest: XCTestCase {

    private var sut:MenuItemPresenter!
    private var MenuItemsView:MenuItemsTableViewController!
    
    override func setUp() {
        super.setUp()
        MenuItemsView = MenuItemsTableViewController()
        sut = MenuItemPresenter(categoryName:"entrees",view:MenuItemsView,menuController:MocNetworkManager(fileName: "MenuItems"))
    }

    override func tearDown() {
        sut = nil
        MenuItemsView = nil
        
        super.tearDown()
    }

    func testSut_whenInitCalled_MenuItemsViewIsSet() {
        
        // Then
        XCTAssertNotNil(sut.view)
    }

    func testSut_whenLoadMenuItemsCalled_menuItemsAreFilled() {
                
        // When
        sut.loadMenuItems()
        
        // Then
        XCTAssertNotEqual(sut.menuItems,nil)
    }
    
    func testSut_whenGetMenuItemAtIndexCalled_correctMenuItemIsReturned() {
        
        // Given
        sut.loadMenuItems()
        
        // When
        let firstMenuItemName = sut.getMenuitemAtIndex(indexPath: 0)?.name
        
        // Then
        XCTAssertEqual(firstMenuItemName, "Spaghetti and Meatballs")
    }
    
    func testSut_whenGetMenuItemsCountCalled_correctNumberOfItemsIsReturned() {
        
        // Given
        sut.loadMenuItems()
        
        // When
        let itemsCount = sut.getMenuItemsCount()
        
        // Then
        XCTAssertNotEqual(itemsCount,3)

    }
    
    func testSut_whenLoadMenuItemsCalledWithFailure_menuItemsStillEmpty() {
        // Given
        sut = MenuItemPresenter(categoryName:"entrees",view: MenuItemsView,menuController: MocNetworkManager(fileName:"Error"))
        
        // Then
        sut.loadMenuItems()
        
        // Then
        XCTAssertEqual(sut.menuItems,nil)

    }
}
