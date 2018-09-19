//
//  DayDatasource.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class DayDatasource: Datasource{
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [DayCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return searchPrescriptions()[indexPath.item] //Put local drug list instead
    }
    
    func searchPrescriptions()->[Prescription]{
        var orderedList:[Prescription] = []
        for p in Prescription.myPrescriptions{
            for date in p.timesToTake{
                let d:[Int] = myCalendar.parseStringDate(date)
                if d[0] == HomeDatasourceController.currentDisplayedMonth && d[1] == DayController.own.day && d[2] == HomeDatasourceController.currentDisplayedYear{
                    orderedList.append(p)
                }
            }
        }
        //Also need to sort orderedList by hours/minutes within day
        return orderedList
    }
    override func numberOfItems(_ section: Int) -> Int {
        return searchPrescriptions().count //Put length of drug list instead
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
}



