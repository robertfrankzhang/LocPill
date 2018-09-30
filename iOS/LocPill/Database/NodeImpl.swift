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
        
    }
    func getCurrentUserID()->String?{
        return ""
    }
    func createUser(name:String?,email:String?,password:String?){
        
    }
    func isLoggedIn()->Bool{
        return true
    }
    func signOut(){
        
    }
    func logIn(email:String?,password:String?){
        
    }
    func getPrescriptions(completionHandler:@escaping (_ prescriptions:[Prescription]?)->()){
        
    }
    func getPastPrescriptions(completionHandler:@escaping (_ prescriptions:[Prescription]?)->()){
        
    }
}
