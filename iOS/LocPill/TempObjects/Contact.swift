//
//  Contact.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
class Contact{
    static var myContacts:[Contact] = []
    var name:String = ""
    var relation:String = ""
    var number:String = ""
    init() {
    }
    
    init(name:String,relation:String,number:String) {
        self.name = name
        self.relation = relation
        self.number = number
    }
}
