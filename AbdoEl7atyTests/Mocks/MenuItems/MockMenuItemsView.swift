//
//  MockMenuItemsView.swift
//  AbdoEl7atyTests
//
//  Created by Sarah Nassrat  on 3/5/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import AbdoEl7aty

class MockMenuItemsView: MenuItemsControllerProtocols {
    var isTableReloaded = false
    private var presenter : MenuItemsPreseterProtocols?
    
    func reloadTableData() {
        isTableReloaded = true
    }
    
    func setPresenter(presenter: MenuItemsPreseterProtocols) {
        self.presenter = presenter
    }
    

}
