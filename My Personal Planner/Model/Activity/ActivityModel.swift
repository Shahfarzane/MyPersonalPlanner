//
//  ActivityModel.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-12.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//


import Foundation

import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}
