//
//  OrderPresenterTest.swift
//  AbdoEl7atyTests
//
//  Created by Abdo on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest

@testable import AbdoEl7aty

class OrderPresenterTest: XCTestCase {

    private var sut:OrderPresenter!
    private var orderView: OrderTableViewController!
    private var normalCasesMockNetworkMaanager = MocNetworkManager(fileName: "OrderResponse")
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        orderView = OrderTableViewController()
        sut = OrderPresenter(view: orderView, menuControllerProtocol:normalCasesMockNetworkMaanager)
    }

    override func tearDown() {
        sut = nil
        orderView = nil
    }

    
    func testSut_whenInitCalled_orderViewIsSet() {
                
        XCTAssertNotNil(sut.mView)
        
    }
    
    func testSut_whenSubmitOrderShouldReturnPreperationTimeOfFive(){
        //when
         sut.submitOrder()
        
        //test
        XCTAssertNotNil(sut.response)
    }

    
    
    func testSut_whenGetCategoriesAtIndexPathCalled_resultAreReturned() {
        
        
        let count = sut.getOrdersCount()
        
        XCTAssertEqual(count, 2)
        
        
    }
    
    func testSut_whenRemovingFromList_CountShouldBeLessThanPreviousWithOne(){
        //when
        normalCasesMockNetworkMaanager.addItem(itemID:MenuItem(id: 1, name: "a", detailText: "a", price: 1.1, category:"a", imageURL: nil))
        XCTAssertNotEqual(sut.getOrdersCount(), 0)
        let count = sut.getOrdersCount()

        //Test
        sut.removeItem(index: 0)
        XCTAssertEqual(sut.getOrdersCount(), count-1)
    }
    
    func testSut_whenLoadResultCalledWithFailure_resultStillEmpty() {
        
        sut = OrderPresenter(view: orderView, menuControllerProtocol: MocNetworkManager(fileName: "Error"))
                
        XCTAssertEqual(sut.response?.preparationTime , nil)
        
        
    }
    

}
