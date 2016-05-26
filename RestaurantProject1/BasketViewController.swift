//
//  BasketViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 26.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // создаем программно кнопку устанавливаем ей картину и задаем действие
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
    // клик левой кнопки переходящей на главную вьюху
    func btn_clickedLeft(sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("basketCell", forIndexPath: indexPath)
        
        return cell
        
    }

    // переход на экран оформления
    @IBAction func ZakazAction(sender: AnyObject) {
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier("DecorViewController") as! DecorViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
  
}
