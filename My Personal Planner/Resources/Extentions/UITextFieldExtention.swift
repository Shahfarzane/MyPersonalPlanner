//
//  UITextFieldExtention.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-15.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

extension UITextField {
    var hasValue: Bool {
        guard text == "" else { return true }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.image = #imageLiteral(resourceName: "warning")
        imageView.contentMode = .scaleAspectFit
        
        rightView = imageView
        rightViewMode = .unlessEditing
        
        return false
    }
}
