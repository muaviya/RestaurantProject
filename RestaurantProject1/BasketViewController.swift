//
//  BasketViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 26.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let btnL = UIButton()
        btnL.setImage(UIImage(named: "close.jpg"), forState: .Normal)
        btnL.frame = CGRectMake(0, 0, 30, 30)
        btnL.addTarget(self, action: #selector(BasketViewController.btn_clickedLeft(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: btnL), animated: true)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]

        self.title = "Корзина"
    }
    
    func btn_clickedLeft(sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //self.presentViewController(vc, animated: true, completion: nil)
    }

  
}
