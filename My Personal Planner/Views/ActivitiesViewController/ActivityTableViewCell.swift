//
//  ActivityTableViewCell.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-13.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.addShadowAndRoundCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontDBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFont, size: 15)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func setup(model: ActivityModel){
        titleLabel.text = model.title
        iconImg.image = getActivityImageView(type:model.activityType)
        subtitleLabel.text = model.subTitle
        
    }
    
    func getActivityImageView(type:ActivityType) -> UIImage?{
        
        switch type{
            
        case .auto:
            return #imageLiteral(resourceName: "Car")
        case .excursion:
            return #imageLiteral(resourceName: "Excursion")
        case .flight:
             return #imageLiteral(resourceName: "Flight")
        case .food:
             return #imageLiteral(resourceName: "Food")
        case .hotel:
             return #imageLiteral(resourceName: "Hotel")

        }
    }
}
