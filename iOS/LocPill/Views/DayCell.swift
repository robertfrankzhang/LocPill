//
//  DayCell.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class DayCell:DatasourceCell{
    
    var unlocked = false
    
    override var datasourceItem: Any?{
        didSet{
            let drug = datasourceItem as! Prescription
            nameLabel.text = drug.name
            roleLabel.text = "\(drug.pillsPerDose) pills"
            for date in drug.timesToTake{
                let d = myCalendar.parseStringDate(date)
                if d[0] == HomeDatasourceController.currentDisplayedMonth && d[1] == DayController.own.day && d[2] == HomeDatasourceController.currentDisplayedYear{//If drug time is on selected date
                    if myCalendar.getMonth() == HomeDatasourceController.currentDisplayedMonth && myCalendar.getYear() == HomeDatasourceController.currentDisplayedYear && myCalendar.getDay() == DayController.own.day{//If selected date is today
                        //If time is past, unlock, else don't
                        if d[3] < myCalendar.getHour(){
                            unlock()
                        }else if d[3] == myCalendar.getHour(){
                            if d[4] < myCalendar.getMinute(){
                                unlock()
                            }else if d[4] == myCalendar.getMinute(){
                                if d[5] <= myCalendar.getSecond(){
                                    unlock()
                                }
                            }
                        }
                    }//So if the day is past, the drug is no longer valid for taking
                }
            }
        }
    }
    
    func unlock(){
        unlocked = true
        lockImg.image = #imageLiteral(resourceName: "gift")
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
    
    let lockImg:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lockClosed"))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = true
        
        addSubview(buttonView)
        addSubview(nameLabel)
        addSubview(roleLabel)
        addSubview(numLeftView)
        addSubview(lockImg)
        
        buttonView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width*0.7, heightConstant: self.frame.height-20)
        
        nameLabel.anchor(buttonView.topAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        roleLabel.anchor(nameLabel.bottomAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        numLeftView.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: self.frame.width*0.3-30, heightConstant: self.frame.height-20)
        
        lockImg.anchor(numLeftView.topAnchor, left: numLeftView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 22, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.open(tap:)))
        print(lockImg.frame)
        numLeftView.addGestureRecognizer(gestureTap)
    }
    
    @objc func open(tap:UITapGestureRecognizer){
        print("hdafsd")
        if unlocked{
            print("unlocked!")
        }
    }
    
    
}
