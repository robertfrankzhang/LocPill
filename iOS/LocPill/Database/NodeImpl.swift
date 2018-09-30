//
//  NodeImpl.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/29/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation

class NodeImpl:DatabaseDelegate{
    func setupInitialState(){
        //Do nothing
    }
    
    func createUser(name:String?,email:String?,password:String?){ //Use Create A User
        
    }
    func isLoggedIn()->Bool{ //Check if local token is nil
        return true
    }
    func signOut(){//Make all local data nil
        
    }
    func logIn(email:String?,password:String?){ //Either manually put in email/password via login or if email/password not nil use that for auto login
        
    }
    func getPrescriptions(completionHandler:@escaping (_ prescriptions:[Prescription]?)->()){//List All Prescriptions (no history)
        
    }
    func getPastPrescriptions(completionHandler:@escaping (_ prescriptions:[History]?)->()){//All Histories (on app load
        
    }
    func openDispenser(pillCount:Int){//Request Drug Dispense
        
    }
}
