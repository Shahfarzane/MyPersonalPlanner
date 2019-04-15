//
//  UITableViewCellExtentions.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-13.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit


extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
}
