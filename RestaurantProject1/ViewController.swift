//
//  ViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 19.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    var imageArray = [UIImage]()
    var image1 = UIImage(named: "1")
    var image2 = UIImage(named: "2")
    
    var pageViewController: UIPageViewController!
    var scrollView: UIScrollView!
    var pageControl : UIPageControl!
    var frame : CGRect = CGRectMake(0, 0, 0, 0)


    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var tableCollectionView: UICollectionView!
    @IBOutlet weak var pageContainer: UIView!
    
    let reach = Reachability()
    
    var foodModel : [Food] = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.useUserDefoults()
        self.settingPC()
        self.addModeltoArrayFood()
    
    }
    
    func addModeltoArrayFood() {
        
        foodModel = [Food(name: "Пюре", price: 100), Food(name: "Пицца", price: 180), Food(name: "Лагман", price: 110), Food(name: "Шаурма", price: 80), Food(name: "Узбекский плов", price: 130), Food(name: "Чек Кебаб", price: 240), Food(name: "Макароны по флотски", price: 100)]
    }
    
    // Page Control
    func settingPC() {
        
        self.mySearchBar.hidden = true
        
        imageArray.append(image1!)
        imageArray.append(image2!)
        
        self.pageContainer.frame = CGRectMake(0, 0, self.view.frame.width, self.pageContainer.frame.height)
        self.scrollView = UIScrollView(frame: CGRectMake(0,0, self.pageContainer.frame.width, self.pageContainer.frame.height))
        
        self.pageControl = UIPageControl(frame: CGRectMake(0,250, self.pageContainer.frame.width, 30))
        
        scrollView.delegate = self
        
        configurePageController()
        
        self.pageContainer.addSubview(scrollView)
        
    }
    // Page Control
    func configurePageController() {
        
        self.pageControl.numberOfPages = imageArray.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor =   UIColor.redColor()
        self.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        self.pageContainer.addSubview(pageControl)
        
    }
    // Page Control
    func setPageViewInScoll() {
        
        for index in 0..<2 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            
            let subView = UIView(frame: frame)
            let image = UIImageView(frame: subView.frame)
            image.image = imageArray[index]
            
            subView.addSubview(image)
            self.scrollView.addSubview(subView)
            self.mySearchBar.hidden = true
            
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height)
        
        // pageControl.addTarget(self, action: Selector("changePage"), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setPageViewInScoll()
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
    
    // UICollectionViewDataSource
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
        
        self.scrollView.frame = CGRectMake(0, 40, self.pageContainer.frame.width, self.pageContainer.frame.height)
        
        self.mySearchBar.hidden = false
        //self.mySearchBar.showsCancelButton = true
        self.mySearchBar.setShowsCancelButton(true, animated: true)
    }
    
    // обработка нажатия на Cancel в search bar
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.scrollView.frame = CGRectMake(0, 0, self.pageContainer.frame.width, self.pageContainer.frame.height)
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
    
    


