//
//  LikedVC.swift
//  RestaurantProject1
//
//  Created by Muaviya on 25.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class LikedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var foodModel : [Food] = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addModeltoArrayFood()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Избранное"
    }
    
    func addModeltoArrayFood() {
        
        foodModel = [Food(name: "Пюре", price: 100), Food(name: "Пицца", price: 180)]
    }

    
    // обработка нажатия
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc : AboutDishVC = self.storyboard?.instantiateViewControllerWithIdentifier("AboutDishVC") as! AboutDishVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodModel.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! LikedCollectionViewCell
        
        cell.labelString.text = foodModel[indexPath.row].name
        cell.priceLabel.text = String(foodModel[indexPath.row].price) + "р"
        
        return cell
        
    }

}
