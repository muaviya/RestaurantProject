//
//  ViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 19.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Главная" // 
        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.greenColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()

    }
    
}

