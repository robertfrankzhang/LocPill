//
//  PersistData.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/29/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
class PersistData{
    var email:String? = ""
    var password:String? = ""
}

class NotPersistData{
    var authToken:String? = ""
    var histories:[History] = []
    var prescriptions:[Prescription] = []
}
