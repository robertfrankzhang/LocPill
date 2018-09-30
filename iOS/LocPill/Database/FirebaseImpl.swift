//
//  FirebaseImpl.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/7/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import Firebase

class FirebaseImpl:DatabaseDelegate{
    func setupInitialState(){
        FirebaseApp.configure()
    }
    
    func getCurrentUserID()->String?{
        return Auth.auth().currentUser?.uid
    }
    
    func createUser(name:String?, email: String?, password: String?) {
        guard let email2 = email, let password2 = password, let name2 = name else{
            return
        }
        
        Auth.auth().createUser(withEmail: email2, password: password2, completion: {(user:User?, error) in
            if error != nil{
                print(error)
                return
            }
            
            guard let uid = user?.uid else{
                return
            }
            
            //successfully authenticated user
            let ref = Database.database().reference(fromURL: "https://locpill-68dae.firebaseio.com/")
            let usersReference = ref.child("users").child(uid) //opens new directory under unique User ID
            
            let values = ["doctorEmail":name2,"email":email2]
            usersReference.updateChildValues(values, withCompletionBlock: { (err,ref) in
                if err != nil{
                    print(err)
                    return
                }
                
                print("Saved user successfully into Firebase DB")
                LoginDatasourceController.own.dismiss(animated: true, completion: nil)
                return
            })
        })
    }
    
    func isLoggedIn()->Bool{
        return !(Auth.auth().currentUser == nil)
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
        }catch let logoutError{
            print(logoutError)
        }
    }
    
    func logIn(email:String?,password:String?){
        guard let email2 = email, let password2 = password else{
            return
        }
        
        Auth.auth().signIn(withEmail: email2, password: password2, completion: {
            (user,error) in
            if error != nil{
                print(error)
                return
            }
            
            LoginDatasourceController.own.dismiss(animated: true, completion: nil)
        })
    }
    
    func getPrescriptions(completionHandler:@escaping (_ prescriptions:[Prescription]?)->()){
        var returnedPrescriptionList:[Prescription]? = nil
        Database.database().reference().child("users").child(getCurrentUserID()!).child("prescriptions").observe(.value, with:{(snapshot) in
            if let prescriptions = snapshot.value as? [String:AnyObject]{
                var pList:[Prescription] = []
                for prescription in prescriptions.keys{
                    let prescriptionDict = prescriptions[prescription]!
                    let prescription = Prescription(name: prescriptionDict["name"] as! String, locationOfDrug: prescriptionDict["containerNum"] as! Int, timesToTake: [], timeToTakeEnum: prescriptionDict["freqEnum"] as! Int, pillsPerDose: prescriptionDict["pillsPerDose"] as! Int, pillsLeft: prescriptionDict["pillsLeft"] as! Int)
                    var dArray:[String] = []
                    for date in (prescriptionDict["dates"] as! [String:AnyObject]).keys{
                        dArray.append(date as! String)
                    }
                    prescription.timesToTake = dArray
                    returnedPrescriptionList?.append(prescription)
                }
            }
            
            if returnedPrescriptionList == nil{
                completionHandler(nil)
            }else{
                completionHandler(returnedPrescriptionList)
            }
        }, withCancel:nil)
    }
    
    func getPastPrescriptions(completionHandler:@escaping (_ prescriptions:[History]?)->()){
        completionHandler(nil)
    }
    
    func openDispenser(pillCount:Int){
        
    }
    
}



























