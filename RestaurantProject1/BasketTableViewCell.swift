//
//  BasketTableViewCell.swift
//  RestaurantProject1
//
//  Created by Muaviya on 26.05.16.
//  Copyright © 2016 DGUNH. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var gramFoodLabel: UILabel!
    @IBOutlet weak var priceFoodLabel: UILabel!
    @IBOutlet weak var imageOnCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
