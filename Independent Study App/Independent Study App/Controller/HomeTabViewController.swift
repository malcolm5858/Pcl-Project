//
//  HomeTabViewController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import UIKit

class HomeTabViewController: UITabBarController, UITabBarControllerDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Moved")
    }
    
}

