//
//  TripsTableViewCell.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-09.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tripImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        cardView.addShadowAndRoundCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName,size: 32)
        cardView.backgroundColor = Theme.accent
        tripImage.layer.cornerRadius = cardView.layer.cornerRadius
        


    }


    
    func setup(tripModel: TripModel){
        titleLabel.text = tripModel.title
        if let tripImg = tripModel.image     {
            tripImage.alpha = 0.3
            tripImage.image = tripImg
            UIView.animate(withDuration: 1){
                self.tripImage.alpha = 1
            }
            
        }

    }
}
