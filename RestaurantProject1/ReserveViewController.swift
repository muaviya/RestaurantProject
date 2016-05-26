//
//  ReserveViewController.swift
//  RestaurantProject1
//
//  Created by Muaviya on 26.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class ReserveViewController: UIViewController {
    
    var inputTextFieldName: UITextField?
    var inputTextFieldPhoneNumber: UITextField?
    var inputTextFieldTime: UITextField?

    @IBOutlet weak var imageFood: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func postMethod() {
        print(inputTextFieldName!.text!)
        print(inputTextFieldPhoneNumber!.text!)
        print(inputTextFieldTime!.text!)
        
        /*
        if self.inputTextFieldName!.text! != "" && self.inputTextFieldAbout!.text! != "" {
            let parameters = [
                "name": self.inputTextFieldName!.text!,
                "about": self.inputTextFieldAbout!.text!,
                "platform": "ios"
            ]
            
            Alamofire.request(.POST, "http://movieposters.crvit.ru/API/add_revies.php", parameters: parameters)
        } else {
            
            let alertController = UIAlertController(title: "Ошибка", message: "Заполните пожалуйста все строки", preferredStyle: .Alert)
            
            let alertCancelAction = UIAlertAction(title: "Ок", style: .Default, handler: nil)
            
            alertController.addAction(alertCancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
     */
    }

    
    // алерт для отображение пользовательского предложения
    
    func userSentence() {
        
        let alertController = UIAlertController(title: "Предложение", message: "Если у вас есть какие то замечания, или предложения по поводу программы можете написать нам.", preferredStyle: .Alert)
        
        let alertCancelAction = UIAlertAction(title: "Отмена", style: .Default, handler: nil)
        let addAction = UIAlertAction(title: "Отправить",
                                      style: .Default,
                                      handler: {(alert: UIAlertAction!) in self.postMethod()})
        
        
        alertController.addAction(alertCancelAction)
        alertController.addAction(addAction)
        
        alertController.addTextFieldWithConfigurationHandler { (name) in
            
            name.placeholder = "Ваше имя"
            
            if name.text?.characters != nil {
                self.inputTextFieldName =  name
            }
            
        }
        
        alertController.addTextFieldWithConfigurationHandler { (phoneNum) in
            
            phoneNum.placeholder = "Номер телефона"
            
            if phoneNum.text?.characters != nil {
                self.inputTextFieldPhoneNumber =  phoneNum
            }
            
        }
        
        alertController.addTextFieldWithConfigurationHandler { (time) in
            
            time.placeholder = "Предпочтительное время"
            
            if time.text?.characters != nil {
                self.inputTextFieldTime = time
            }
        }
        
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(alertController, animated: true, completion: nil)
        })
        
    }

    @IBAction func reserveAction(sender: AnyObject) {
        self.userSentence()
    }

//    @IBAction func closeActionInMainVC(sender: AnyObject) {
//        let vc = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
//        //self.navigationController?.pushViewController(vc, animated: true)
//        self.presentViewController(vc, animated: true, completion: nil)
//    }
}
