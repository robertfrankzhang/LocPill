//
//  Home.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

////////////TOP BARS///////////

class MonthTopBar: DatasourceCell{
    var hasViewed = false
    
    override var datasourceItem: Any?{
        didSet{
            if let temp = datasourceItem as? [String]{
                monthLabel.text = temp[0]
                yearLabel.text = temp[1]
                
                if !hasViewed{
                    monthLabel.frame = CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 200, height: 30)
                    monthLabel.center = CGPoint(x:self.frame.width/2,y:self.frame.height/2)
                    
                    yearLabel.anchor(monthLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: self.frame.width/2-yearLabel.intrinsicContentSize.width/2, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                }
                hasViewed = true
            }
        }
    }
    
    let monthLabel:UILabel = {
        let label = UILabel()
        label.text = "Month Name"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = ThemeColor.red
        label.textAlignment = .center
        return label
    }()
    
    let yearLabel:UILabel = {
        let label = UILabel()
        label.text = "Year Name"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = ThemeColor.red
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var leftArrow:UIButton = {
        let imageView = UIButton()
        imageView.setImage(#imageLiteral(resourceName: "arrowLeft").withRenderingMode(.alwaysOriginal), for: .normal)
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        imageView.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
        return imageView
    }()
    
    lazy var rightArrow:UIButton = {
        let imageView = UIButton()
        imageView.setImage(#imageLiteral(resourceName: "arrowRight").withRenderingMode(.alwaysOriginal), for: .normal)
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        imageView.addTarget(self, action: #selector(rightClick), for: .touchUpInside)
        imageView.adjustsImageWhenHighlighted = true
        return imageView
    }()
    
    @objc func leftClick(){
        leftArrow.pulsate()
        HomeDatasourceController.own.leftButtonClick()
    }
    
    @objc func rightClick(){
        rightArrow.pulsate()
        HomeDatasourceController.own.rightButtonClick()
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = true
        separatorLineView.backgroundColor = ThemeColor.border
        addSubview(monthLabel)
        addSubview(yearLabel)
        addSubview(leftArrow)
        addSubview(rightArrow)
        
        leftArrow.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: self.frame.height/2-30/2, leftConstant: self.frame.width/12, bottomConstant: 0, rightConstant: 0, widthConstant: 35+17, heightConstant: 35)
        rightArrow.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: self.frame.height/2-30/2, leftConstant: 0, bottomConstant: 0, rightConstant: self.frame.width/12, widthConstant: 35+17, heightConstant: 35)
    }
}

class staticDayDisplayBar: DatasourceCell{
    
    override var datasourceItem: Any?{
        didSet{
            dayLabel.text = datasourceItem as? String
        }
    }
    
    let dayLabel:UILabel = {
        let label = UILabel()
        label.text = "Day"
        label.textColor = ThemeColor.red
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = true
        separatorLineView.backgroundColor = ThemeColor.lightGray
        addSubview(dayLabel)
        
        dayLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

////////////CELLS///////////

class UserCellDataPackage{
    var day:Int? = nil
    var notMonthDay:Int? = nil
    var hasViewed = false
    var colorStatus:colorStatus = .white
    var mStatus:monthStatus = .current
    
    init(_ day:Int?){
        self.day = day;
    }
}

enum monthStatus{
    case before
    case current
    case after
}

enum colorStatus{
    case green
    case gray
    case white
}

class UserCalendar: DatasourceCell {
    var day:Int = 0
    override var datasourceItem: Any?{
        didSet{
            let day = datasourceItem as! UserCellDataPackage
            if day.day != nil{
                dateLabel.text = "\(day.day!)"
                self.day = day.day!
            }else{
                dateLabel.text = "\(day.notMonthDay!)"
                dateLabel.textColor = ThemeColor.lightGray
            }
            
            
            if day.colorStatus == .white{
                backgroundColor = ThemeColor.whitish
            }else if day.colorStatus == .gray{
                backgroundColor = ThemeColor.veryLightGray
            }else if day.colorStatus == .green{
                backgroundColor = ThemeColor.lightGreen
            }
        }
    }
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let button:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = true
        separatorLineView.backgroundColor = ThemeColor.border
        addSubview(button)
        addSubview(dateLabel)
        
        button.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.add(tap:)))
        button.addGestureRecognizer(gestureTap)
        dateLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 13, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    @objc func add(tap:UITapGestureRecognizer){
        if day != 0{
            let dayController = DayController(day:day)
            HomeDatasourceController.own.present(UINavigationController(rootViewController: dayController),animated:true,completion: nil)
        }
    }
}

////////////GROUPS///////////

class HomeGroupListHeader: DatasourceCell{
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "My Prescriptions"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font.withSize(25)
        label.textColor = ThemeColor.whitish
        return label
    }()
  
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.blue
        separatorLineView.isHidden = false
        
        addSubview(titleLabel)
        titleLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: self.frame.height/2-titleLabel.intrinsicContentSize.height/2, leftConstant: self.frame.width/2-titleLabel.intrinsicContentSize.width/2, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}

///UNUSED:
class CalendarHeader:DatasourceCell{
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = ThemeColor.border
    }
}

class CalendarFooter:DatasourceCell{
    override func setupViews() {
        super.setupViews()
        backgroundColor = ThemeColor.whitish
    }
}
