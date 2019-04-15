//
//  UIButtonExtention.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-09.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

extension UIButton {
    
    func createFloatingActionButton() {
        //backgroundColor = Theme.Tint
        //layer.cornerRadius = addButton.frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
