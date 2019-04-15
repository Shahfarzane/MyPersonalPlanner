//
//  AppButton.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-10.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }
}
