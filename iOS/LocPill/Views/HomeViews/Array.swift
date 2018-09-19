//
//  Array.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class ArrayCell:DatasourceCell{
    
    override func setupViews() {//Cell that contains a single CollectionView of Feed Cells
        backgroundColor = .clear
        var controller = CalendarArrayController()
        HomeDatasourceController.own.display(contentController: controller, on: self)
    }
}
