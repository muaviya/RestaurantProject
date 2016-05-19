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
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var searchBool = false
    let reach = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.mySearchBar.hidden = true
        self.useUserDefoults()
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Главная"
        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.greenColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
    
        
        if !reach.isConnectedToNetwork() {
            
            self.alertIsNotConnectNetwork()
            
        }
        
    }
    
    // алерт если подключение отсутсвует.
    func alertIsNotConnectNetwork() {
        
        let alertController = UIAlertController(title: "У вас нет подключения к интернету", message: "Проверьте подключение", preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(alertAction)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(alertController, animated: true, completion: nil)
        })
    }

    
    // кнопка для отображение searchBar
    @IBAction func searchButtonAction(sender: AnyObject) {
        
        self.mySearchBar.hidden = false
        
    }
    
    // алерт для отображение промо кода для первого запуска (последующий раз не будет вызвыаться)
    func alertInFerstOpenApp() {
        
        let alertController = UIAlertController(title: "Промо код", message: "Если у вас есть промо код друга, введите его пожалуйста", preferredStyle: .Alert)
        
        let alertCancelAction = UIAlertAction(title: "Отмена", style: .Default, handler: nil)
        let alertOkAction = UIAlertAction(title: "Принять", style: .Default, handler: nil)
        
        alertController.addAction(alertCancelAction)
        alertController.addAction(alertOkAction)
        
        alertController.addTextFieldWithConfigurationHandler { (promoKodTextField) in
            
            promoKodTextField.placeholder = "Введите промо код"
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(alertController, animated: true, completion: nil)
        })
        
    }
    
    //  функция для отображения алерта один раз за весь жизненный цикл приложение
    func useUserDefoults() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let autorizated : Bool = defaults.boolForKey("autorizated")
        
        if (!autorizated) {
            
            self.alertInFerstOpenApp()
            defaults.setBool(true, forKey: "autorizated")
            defaults.synchronize()
            
        }
    }

    
            
}
    
    


