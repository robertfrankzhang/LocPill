//
//  DatabaseDelegate.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/7/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import UIKit

protocol DatabaseDelegate {
    func setupInitialState()
    func getCurrentUserID()->String?
    func createUser(name:String?,email:String?,password:String?)
    func isLoggedIn()->Bool
    func signOut()
    func logIn(email:String?,password:String?)
    func addContact(name:String,relation:String,number:String)
    func getContacts(completionHandler:@escaping (_ contacts:[Contact]?)->())
    func getPrescriptions(completionHandler:@escaping (_ prescriptions:[Prescription]?)->())
    func getDoctorContact(doctorEmail:String,completionHandler:@escaping (_ contact:Contact?)->())
    func getDoctorEmail(completionHandler:@escaping (_ email:String?)->())
}
