//
//  AboutDishVC.swift
//  RestaurantProject1
//
//  Created by Muaviya on 23.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class AboutDishVC: UIViewController, UINavigationBarDelegate {

    @IBOutlet weak var AddAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddAction.layer.cornerRadius = 20
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(named: "back.jpg"), forState: .Normal)
        btn1.frame = CGRectMake(0, 0, 30, 30)
        btn1.addTarget(self, action: #selector(AboutDishVC.btn_clicked(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: btn1), animated: true)
    
    }
    
    func btn_clicked(sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func actionToBasket(sender: AnyObject) {
        
    }

}

/*
 // Create the navigation bar
 let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44)) // Offset by 20 pixels vertically to take the status bar into account
 
 navigationBar.backgroundColor = UIColor.whiteColor()
 navigationBar.delegate = self;
 
 // Create a navigation item with a title
 let navigationItem = UINavigationItem()
 navigationItem.title = "Title"
 
 // Create left and right button for navigation item
 let leftButton =  UIBarButtonItem(title: "", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(AboutDishVC.btn_clicked(_:)))
 
 leftButton.image = UIImage(named: "back")
 let rightButton = UIBarButtonItem(title: "Right", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
 
 // Create two buttons for the navigation item
 navigationItem.leftBarButtonItem = leftButton
 navigationItem.rightBarButtonItem = rightButton
 
 // Assign the navigation item to the navigation bar
 navigationBar.items = [navigationItem]
 
 // Make the navigation bar a subview of the current view controller
 self.view.addSubview(navigationBar)
 

 
 func btn_clicked(sender: UIBarButtonItem) {
 let vc = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
 //self.navigationController?.pushViewController(vc, animated: true)
 
 self.presentViewController(vc, animated: true, completion: nil)
 }

 
 // создание кнопки с лева программно 
 
 let btn1 = UIButton()
 btn1.setImage(UIImage(named: "back.jpg"), forState: .Normal)
 btn1.frame = CGRectMake(0, 0, 30, 30)
 btn1.addTarget(self, action: #selector(AboutDishVC.btn_clicked(_:)), forControlEvents: .TouchUpInside)
 self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: btn1), animated: true)

 */
