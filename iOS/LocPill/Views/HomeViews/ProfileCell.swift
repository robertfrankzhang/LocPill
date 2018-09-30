//
//  ProfileCell.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents
import LocalAuthentication
import UIKit

class ProgressBarView:UIView{
    var bgPath: UIBezierPath = UIBezierPath()
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    init(frame: CGRect,x:CGFloat,y:CGFloat,radius:CGFloat) {
        super.init(frame: frame)
        let center = CGPoint(x: x, y: y)
        bgPath.addArc(withCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        bgPath.close()
        simpleShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func simpleShape() {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.clear.cgColor
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineWidth = 3
        progressLayer.lineCap = kCALineCapRound
        progressLayer.fillColor = nil
        progressLayer.strokeColor = ThemeColor.blue.cgColor
        progressLayer.strokeEnd = 0.8
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    var progress: Float = 50 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
}

class ProfileCell:DatasourceCell{
    var drug:Prescription = Prescription()
    var unlocked = true
    
    override var datasourceItem: Any?{
        didSet{
            drug = datasourceItem as! Prescription
            nameLabel.text = drug.name
            roleLabel.text = enumToString(drug.timesToTakeEnum)
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
    
    let lockImg:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lockClosed"))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return imageView
    }()
    
    let numLeftView:UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.veryLightGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let progressBar:ProgressBarView = {
        let bar = ProgressBarView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), x: 0, y: 0, radius:22.5)
        return bar
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
        addSubview(progressBar)
        
        buttonView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: self.frame.width*0.7, heightConstant: self.frame.height-20)
        
        nameLabel.anchor(buttonView.topAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        roleLabel.anchor(nameLabel.bottomAnchor, left: buttonView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        numLeftView.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: self.frame.width*0.3-30, heightConstant: self.frame.height-20)
        
        lockImg.anchor(numLeftView.topAnchor, left: numLeftView.leftAnchor, bottom: nil, right: nil, topConstant: 18, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 24, heightConstant: 24)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.open(tap:)))
        print(lockImg.frame)
        numLeftView.addGestureRecognizer(gestureTap)
        
        progressBar.anchor(numLeftView.topAnchor, left: numLeftView.leftAnchor, bottom: nil, right: nil, topConstant: 13+18, leftConstant: 24+18, bottomConstant: 0, rightConstant: 0, widthConstant: 45, heightConstant: 45)
    }
    
    @objc func open(tap:UITapGestureRecognizer){
        if unlocked{
            let context:LAContext = LAContext()
            context.localizedFallbackTitle = ""
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Authenticate With Your Fingerprint", reply: {(wasCorrect,error) in
                    if wasCorrect{
                        print("Correct")
                    }else{
                        print("Incorrect")
                    }
                    
                })
            }
            print("unlocked!")
        }
    }
    
    
}
