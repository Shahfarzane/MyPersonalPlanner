//
//  UIViewExtentions.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-09.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

extension UIView {

    func addShadowAndRoundCorners(){
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
       layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius  = 10
    }

}
