//
//  CustomTabBarControllerViewController.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 11/02/21.
//

import UIKit

class CustomTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeScreen = HomeViewController()
        let homeView = UINavigationController(rootViewController: homeScreen)
        homeView.tabBarItem.title = "Home"
        homeView.tabBarItem.image = UIImage(systemName: "house")
        
        let promotionScreen = PromotionPageViewController()
        let promotionView = UINavigationController(rootViewController: promotionScreen)
        promotionView.tabBarItem.title = "Promotion"
        promotionView.tabBarItem.image = UIImage(systemName: "star")
        
        viewControllers = [homeView,promotionView]
    }
    

    
}
