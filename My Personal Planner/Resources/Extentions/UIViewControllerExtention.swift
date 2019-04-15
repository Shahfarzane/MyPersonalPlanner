//
//  UIViewControllerExtention.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-15.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit
extension UIViewController {

static func getInstance() -> UIViewController {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
    return storyboard.instantiateInitialViewController()!
}
}
