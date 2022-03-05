//
//  OrderTableViewController.swift
//  AbdoEl7aty
//
//  Created by mac on 2/25/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit
protocol OrderTableViewControllerProtocol : AnyObject{
    
    func showAlert(preperation: Int)
    
}

class OrderTableViewController: UITableViewController , OrderTableViewControllerProtocol{
    
    lazy var presenter:OrderPresenterProtocol? = OrderPresenter(view: self)
    var alert: UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
            NotificationCenter.default.addObserver(tableView!,
            selector: #selector(UITableView.reloadData),
            name: MenuController.orderUpdatedNotification, object: nil)
    
        
    }

    
    // MARK: - Table view data source
    


  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter?.getOrdersCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell
            = self.tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! orderTableViewCell
        configureCell(cell, indexPath: indexPath)
        
        return cell
    }
    
    func configureCell(_ cell: orderTableViewCell, indexPath: IndexPath) {
        print(indexPath.row)
        print(presenter?.getOrdersCount())
        let orderName = presenter?.getOrders()[indexPath.row].name ?? ""
        let orderPrice = presenter?.getOrders()[indexPath.row].price.description ?? ""
        cell.itemNameLabel.text = orderName
        cell.itemPriceLabel.text = "$\(orderPrice)"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            presenter?.removeItem(index: indexPath.row)
        }
    }
    @IBAction func submitButtonTapped(_ sender: UIBarButtonItem) {
        presenter?.submitOrder()
    }
    
    func showAlert(preperation: Int) {
        alert = UIAlertController(title: "Preperation Time", message: "Your order will be ready within \(preperation) minutes", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert?.addAction(action)
        self.present(alert!, animated: true, completion: nil)
    }
       
}

