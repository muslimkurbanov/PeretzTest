//
//  TableViewCell.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var countValue = 0
    
    //MARK: - IBActions
    
    @IBAction func minusButton(_ sender: Any) {
        if countValue >= 1 {
            countValue -= 1
            countLabel.text = String(countValue)
        } else { return }
    }
    
    @IBAction func plusButton(_ sender: Any) {
        if countValue <= 8 {
            countValue += 1
            countLabel.text = String(countValue)
        } else { return }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


