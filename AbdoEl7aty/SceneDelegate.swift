//
//  SceneDelegate.swift
//  AbdoEl7aty
//
//  Created by mac on 2/25/22.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var orderTabBarItem:UITabBarItem!
    
    @objc func updateOrderBadge() {
        
        let count = MenuController.orderItemsIds.items.count
        if count == 0 {
            orderTabBarItem.badgeValue = nil
        }else{
            orderTabBarItem.badgeValue = String(count)
        }
        
    }
    var menuControllerProtocol:MenuControllerProtocol!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    
    

        menuControllerProtocol = MenuController.shared
        NotificationCenter.default.addObserver(self, selector:
            #selector(updateOrderBadge),name: menuControllerProtocol.getOrderUpdateNotification(), object: nil)
        
        orderTabBarItem = (window?.rootViewController as?
            UITabBarController)?.viewControllers?[1].tabBarItem
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.


        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


    
    
}

