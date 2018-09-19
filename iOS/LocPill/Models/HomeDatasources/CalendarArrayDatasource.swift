//
//  CalendarArrayDatasource.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeCalendarArrayDataSource: Datasource{
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [FeedCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return CalendarArrayController.calendarArrays[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 3
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    
}



