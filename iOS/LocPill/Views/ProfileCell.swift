//
//  ProfileCell.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class ProfileCell:DatasourceCell{
    var drug:Prescription = Prescription()
    
    override var datasourceItem: Any?{
        didSet{
            drug = datasourceItem as! Prescription
            nameLabel.text = drug.name
            roleLabel.text = enumToString(drug.timesToTakeEnum)
            numImg.text = "\(drug.pillsLeft)"
        }
    }
    
    func enumToString(_ ttt:Int)->String{
        if ttt == 1{
            return "Once a day"
        }
        else if ttt == 2{
            return "Once a week"
        }
        else{
            return "wtf"
        }
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "arb"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let roleLabel:UILabel = {
        let label = UILabel()
        label.text = "arb"
        label.textColor = ThemeColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let buttonView:UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let numLeftView:UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.veryLightGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let numImg:UILabel = {
        let label = UILabel()
        label.text = "74"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = ThemeColor.red
        label.textAlignment = .center
        return label
    }()
    
    let pLeft:UILabel = {
        let label = UILabel()
        label.text = "pills left"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = ThemeColor.red
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = true
        
        addSubview(buttonView)
        addSubview(nameLabel)
        addSubview(roleLabel)
        addSubview(numLeftView)
        addSubview(numImg)
        addSubview(pLeft)
        
        buttonView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width*0.7, heightConstant: self.frame.height-20)
        
        nameLabel.anchor(buttonView.topAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        roleLabel.anchor(nameLabel.bottomAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        numLeftView.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: self.frame.width*0.3-30, heightConstant: self.frame.height-20)
        
        numImg.anchor(numLeftView.topAnchor, left: numLeftView.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 22, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        
        pLeft.anchor(numImg.bottomAnchor, left: numLeftView.leftAnchor, bottom: nil, right: nil, topConstant: -7, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
}
