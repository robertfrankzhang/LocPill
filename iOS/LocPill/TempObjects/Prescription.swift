//
//  Prescription.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
class Prescription{
    static var myPrescriptions:[Prescription] = [Prescription(name: "Advil", locationOfDrug: 1, timesToTake: ["9-8-2018","9-9-2018","9-11-2018","10-12-2018"], timeToTakeEnum: 1, pillsPerDose: 1,pillsLeft:23),Prescription(name: "Lipitor", locationOfDrug: 2, timesToTake: ["9-8-2018-22-41-00","9-9-2018-1-30-00","9-9-2018-10-30-00","9-22-2018","10-11-2018","9-7-2018"], timeToTakeEnum: 2, pillsPerDose: 2,pillsLeft:11)]
    
    var name:String = ""
    var locationOfDrug:Int = -1
    var timesToTake:[String] = []
    var pillsPerDose:Int = -1
    var timesToTakeEnum:Int = -1
    var pillsLeft = -1
    
    init(){
        
    }
    
    init(name:String,locationOfDrug:Int,timesToTake:[String],timeToTakeEnum:Int,pillsPerDose:Int,pillsLeft:Int) {
        self.name = name
        self.locationOfDrug = locationOfDrug
        self.timesToTake = timesToTake
        self.timesToTakeEnum = timeToTakeEnum
        self.pillsPerDose = pillsPerDose
        self.pillsLeft = pillsLeft
    }
}
