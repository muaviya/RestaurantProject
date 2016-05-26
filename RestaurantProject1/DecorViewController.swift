//
//  DecorViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 26.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class DecorViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // создаем программно кнопку устанавливаем ей картину и задаем действие
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let btnL = UIButton()
        btnL.setImage(UIImage(named: "close.jpg"), forState: .Normal)
        btnL.frame = CGRectMake(0, 0, 30, 30)
        btnL.addTarget(self, action: #selector(DecorViewController.btn_clickedLeft(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: btnL), animated: true)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        
        self.title = "Оформление"
    }
    // клик левой кнопки переходящей на главную вьюху
    func btn_clickedLeft(sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("BasketViewController") as! BasketViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func zakazAction(sender: AnyObject) {
    }

}
