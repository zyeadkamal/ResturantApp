//
//  OrderTableViewControllerTest.swift
//  AbdoEl7atyTests
//
//  Created by Abdo on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty


class OrderTableViewControllerTest: XCTestCase {
    
    private var presenter:MockOrderPresenter = MockOrderPresenter()
    private var sut: OrderTableViewController!
    private var normalCasesMockNetworkMaanager = MocNetworkManager(fileName: "OrderResponse")

    
    override func setUp() {
        super.setUp()
        sut = OrderTableViewController()
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
    
    func testSut_whenViewDidLoadCalled_categoryPresenterIsSet() {
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertNotNil(sut.presenter)
    }
    
    func testSut_startsWithEmptyTableView() {
        sut.presenter = presenter
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }

    func testSut_whenGetCategoriesAndReloadTableIsCalled_tableViewIsFilled() {
        sut.presenter =  MockOrderPresenter()
        //sut.loadViewIfNeeded()
        sut.tableView.reloadData()
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), presenter.list.count)
    }
    
    func testSut_whenCellForRowIsCalled_cellIsReturnedWithCorrectData() {
        // Given
        
        // To register the cell with the table view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "OrderTableViewController") as? OrderTableViewController
        sut.loadViewIfNeeded()
        sut.presenter = presenter
        sut.tableView.reloadData()

        
        // When
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? orderTableViewCell
        
        // Then
        XCTAssertEqual(cell?.itemNameLabel.text ?? "", "a")
    }
    
    func testSut_whenShowAletrIsCakked() {
           
        sut.showAlert(preperation: 21)
        XCTAssertNotNil(sut.alert)
    }
    
    
}

class MockOrderPresenter : OrderPresenterProtocol{
    var networkManager: MenuControllerProtocol = MocNetworkManager(fileName: "")
    var list = [MenuItem(id: 1, name: "a", detailText: "a", price: 1.1, category:"a", imageURL: nil)]
    func submitOrder() {
        	
    }
    
    func getOrders() -> [MenuItem] {
        return list
    }
    
    func getOrdersCount() -> Int {
        print("---------------------------------------")
        return list.count;
    }
    
    func removeItem(index: Int) {
        list.remove(at: index)
    }
    
    
}
