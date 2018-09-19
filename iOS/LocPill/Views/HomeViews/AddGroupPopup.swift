//
//  AddGroupPopup.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents

class AddGroupPopup:DatasourceCell{
    
    var screenSize:CGRect = CGRect()
    var initFrame:CGRect = CGRect()
    
    var width:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    let topImg:UIImageView = {
        let img = UIImageView(image: #imageLiteral(resourceName: "AddContact"))
        return img
    }()
    
    lazy var bottomButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ThemeColor.blue
        //button.backgroundColor = ThemeColor.brightMagenta
        button.setTitle("Add", for: .normal)
        button.setTitleColor(ThemeColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        //button.addTarget(self, action: #selector(handleLoginOrRegister), for: .touchUpInside)
        return button
    }()
    
    let name:UITextField = {
        let text = UITextField()
        text.placeholder = "Contact Name"
        text.textAlignment = .center
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = ThemeColor.lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.delegate = HomeDatasourceController.own
        return text
    }()
    
    let relation:UITextField = {
        let text = UITextField()
        text.placeholder = "Relation"
        text.textAlignment = .center
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = ThemeColor.lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.delegate = HomeDatasourceController.own
        return text
    }()
    
    let phoneNumber:UITextField = {
        let text = UITextField()
        text.placeholder = "Phone Number"
        text.textAlignment = .center
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = ThemeColor.lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        text.delegate = HomeDatasourceController.own
        return text
    }()
    
    func phoneNumberValidation(_ num:String)->Bool{
        let character = CharacterSet(charactersIn: "0123456789").inverted
        let inputString:NSArray = num.components(separatedBy: character) as NSArray
        let filtered = inputString.componentsJoined(by: "")
        return num==filtered && num.count == 10
    }

    init(position:CGPoint){
        screenSize = (UIApplication.shared.keyWindow?.frame)!
        width = screenSize.size.width-2*(screenSize.size.width-position.x)
        let height = screenSize.size.height/2
        if position.y > screenSize.height/2{//normal
            print("downl")
            initFrame = CGRect(x:position.x-width,y:position.y-height,width:width,height:height)
            super.init(frame: CGRect(x:position.x,y:position.y,width:0,height:0))
        }else{//thing goes down
            initFrame = CGRect(x:position.x-width,y:position.y+HomeDatasourceController.f.height,width:width,height:height)
            super.init(frame: CGRect(x:position.x,y:position.y+HomeDatasourceController.f.height,width:0,height:0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func createContact(){
        if !(phoneNumber.text?.isEmpty)! && !(relation.text?.isEmpty)! && !(name.text?.isEmpty)!{
            if phoneNumberValidation(phoneNumber.text!){
                //Add contact to database
                DatabaseFactory.DB.addContact(name: name.text!, relation: relation.text!, number: phoneNumber.text!)
                //Dismiss Popup
                HomeDatasourceController.dismissGroupPopupWithoutTap()
            }
            
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        layer.cornerRadius = 10
        layer.masksToBounds = false
        
        addSubview(topImg)
        topImg.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: -70, leftConstant: width/2-50, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        
        addSubview(name)
        name.anchor(topImg.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: width-40, heightConstant: 50)
        
        addSubview(relation)
        relation.anchor(name.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: width-40, heightConstant: 50)
        
        addSubview(phoneNumber)
        phoneNumber.anchor(relation.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: width-40, heightConstant: 50)
        
        let createTapGesture = UITapGestureRecognizer(target: self, action: #selector(createContact))
        addSubview(bottomButton)
        bottomButton.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 20, rightConstant: 0, widthConstant: width-40, heightConstant: screenSize.size.height/12)
        bottomButton.addGestureRecognizer(createTapGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(){
        name.resignFirstResponder()
        relation.resignFirstResponder()
        phoneNumber.resignFirstResponder()
    }
    
}

