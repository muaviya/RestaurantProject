//
//  MenuTableViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 19.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.backgroundColor = UIColor(red: 68/255.0, green: 146/255.0, blue: 75/255.0, alpha: 1.0)
    }

    let section = ["", "Для вас", "Меню"]
    
    let items = [["Главная"], ["Мои бонусы", "Заказ столика", "Избранное"], ["Напитки","Выпечка","Хлеб","Горячее","Закуски"]]
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor(red: 64/255.0, green: 122/255.0, blue: 55/255.0, alpha: 1.0)

        
        let title = UILabel()
        title.font = UIFont(name: "Futura", size: 20)!
        title.textColor = UIColor.whiteColor()
        
        let header1 = view as! UITableViewHeaderFooterView
        header1.textLabel?.font=title.font
        header1.textLabel?.textColor=title.textColor
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.section.count
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items[section].count
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let vc : ReserveViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ReserveViewController") as! ReserveViewController
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        return cell
        
    }
    
}
