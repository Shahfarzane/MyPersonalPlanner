//
//  PopupView.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-10.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        backgroundColor = Theme.background
    }
}
