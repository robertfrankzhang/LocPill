//
//  Calendar.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class FeedCell: DatasourceCell {//Cell that contains a single CollectionView of UserCalendar Cells
    var calendarData:[UserCellDataPackage] = []
    
    override var datasourceItem: Any?{
        didSet{
            if let cData = datasourceItem as? [UserCellDataPackage]{
                calendarData = cData
                var controller = HomeCalendarController(num:calendarData)
                CalendarArrayController.own.display(contentController: controller, on: self)
                
            }
        }
    }
    
    override func setupViews() {
        backgroundColor = .clear
        
    }
}




