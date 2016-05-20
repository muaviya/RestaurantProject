//
//  ViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 19.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var imageSlide: UIScrollView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
    
    var searchBool = false
    let reach = Reachability()
    
    var foodModel : [Food] = [Food]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodModel = [Food(name: "Пюре", price: 100), Food(name: "Пицца", price: 180), Food(name: "Лагман", price: 110), Food(name: "Шаурма", price: 80), Food(name: "Узбекский плов", price: 130), Food(name: "Чек Кебаб", price: 240), Food(name: "Макароны по флотски", price: 100)]
        
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
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! CollectionCellMainVC
        
        cell.labelString.text = foodModel[indexPath.row].name
        cell.priceLabel.text = String(foodModel[indexPath.row].price) + "р"

        return cell
        
    }
    
       // обработка кнопки "Корзина"
    @IBAction func basketAction(sender: AnyObject) {
    }
    
    // кнопка для отображение searchBar
    @IBAction func searchButtonAction(sender: AnyObject) {
        
        self.mySearchBar.hidden = false
        //self.mySearchBar.showsCancelButton = true
        self.mySearchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        self.mySearchBar.hidden = true
        self.mySearchBar.endEditing(true)
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
    
    // алерт если подключение отсутсвует.
    func alertIsNotConnectNetwork() {
        
        let alertController = UIAlertController(title: "У вас нет подключения к интернету", message: "Проверьте подключение", preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alertController.addAction(alertAction)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(alertController, animated: true, completion: nil)
        })
    }
    
}
    
    


