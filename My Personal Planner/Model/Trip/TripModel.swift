//
//  TripModel.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-09.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit
struct  TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]()
    
    
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
        
    }
    
}
