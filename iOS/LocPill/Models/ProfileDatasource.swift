//
//  ProfileDatasource.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class ProfileDatasource: Datasource{
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ProfileCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return Prescription.myPrescriptions[indexPath.item] //Put local drug list instead
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return Prescription.myPrescriptions.count //Put length of drug list instead
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
}



