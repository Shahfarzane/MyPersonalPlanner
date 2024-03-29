//
//  Day.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-12.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//


import Foundation

struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data {
            self.activityModels = data
        }
    }
}
