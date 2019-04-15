//
//  HeaderTableViewCell.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-12.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: Theme.bodyFontBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFont, size: 15)

    }

    func setUp(model: DayModel){
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        
    }

}
