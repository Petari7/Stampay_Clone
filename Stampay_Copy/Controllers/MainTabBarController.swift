//
//  MainTabBar.swift
//  Stampay_Copy
//
//  Created by Petar Ivic on 25/02/2019.
//  Copyright © 2019 Petar Ivic. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
        tabBar.selectedItem?.badgeColor = .blue
        tabBarItem.badgeColor = .lightGray
        
       
        
        
        
}
    
    
func setupControllers() {
        

let nearByController = NearbyController()
let myCardController  = MyCardController()
let meinStampayController =  MeinStampayController()

   
viewControllers = [
            
            
            
generateViewControllers(with: nearByController, unselectedImage: #imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), title: "Stampay Partner", imageSelected: #imageLiteral(resourceName: "search").withRenderingMode(.alwaysTemplate), tabBarTitle: "Nearby"),
generateViewControllers(with: myCardController, unselectedImage: #imageLiteral(resourceName: "card").withRenderingMode(.alwaysOriginal), title: "My Card", imageSelected: #imageLiteral(resourceName: "card").withRenderingMode(.alwaysTemplate), tabBarTitle: "My card"),
generateViewControllers(with: meinStampayController, unselectedImage: #imageLiteral(resourceName: "house").withRenderingMode(.alwaysOriginal), title: "My stampsets", imageSelected: #imageLiteral(resourceName: "house").withRenderingMode(.alwaysTemplate), tabBarTitle: "Mein Stampay"),


]
        
    
}

    
    
    

    

func generateViewControllers(with rootViewController: UIViewController = UIViewController(), unselectedImage: UIImage, title: String, imageSelected: UIImage, tabBarTitle: String) -> UIViewController {
        
        
let navController = UINavigationController(rootViewController: rootViewController)
navController.tabBarItem.image = unselectedImage
navController.tabBarItem.selectedImage = imageSelected
navController.tabBarItem.title = tabBarTitle
rootViewController.navigationItem.title = title
    
navController.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
    
    
return navController
}
    
    
}
