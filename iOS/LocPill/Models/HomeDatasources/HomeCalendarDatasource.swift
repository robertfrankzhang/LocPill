//
//  HomeCalendarDatasource.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeCalendarDataSource: Datasource{
    
    var num:[UserCellDataPackage] = []
    
    init(num:[UserCellDataPackage]){
        self.num = num
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCalendar.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return num[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if num.count<=28{
            return 28
        }
        else if num.count<=35{
            return 35 //The calendar
        }else{
            return 42
        }
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
}



