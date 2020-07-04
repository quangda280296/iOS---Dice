//
//  MyTableViewCell.swift
//  Dice
//
//  Created by Do Huy Nam on 3/23/20.
//  Copyright © 2020 Do Huy Nam. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func visualizeCell(with item: MenuItem) {
        contentImageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        countryLabel.text = item.country
    }
}
