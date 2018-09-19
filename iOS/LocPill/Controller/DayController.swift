//
//  DayController.swift
//  LocPill
//
//  Created by Robert Frank Zhang on 9/8/18.
//  Copyright © 2018 LocPill. All rights reserved.
//

import Foundation
import LBTAComponents

class DayController:DatasourceController{
    static var own = DayController()
    var day:Int
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        let homeDatasource = DayDatasource()
        self.datasource = homeDatasource
    }
    
    override init() {
        self.day = -1
        super.init()
    }
    
    init(day:Int) {
        self.day = day
        super.init()
        DayController.own = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationBarItems(){
        let titleLabel = UILabel()
        if myCalendar.getDay() == day && myCalendar.getMonth() == HomeDatasourceController.currentDisplayedMonth && myCalendar.getYear() == HomeDatasourceController.currentDisplayedYear{
            titleLabel.text = "Today"
        }else{
            titleLabel.text = "\(myCalendar.getMonthAbbrevName(HomeDatasourceController.currentDisplayedMonth)) \(day), \(HomeDatasourceController.currentDisplayedYear)"
        }
        titleLabel.textColor = ThemeColor.whitish
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        navigationItem.titleView = titleLabel
        
        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "x").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backButton)
        
        navigationController?.navigationBar.barTintColor = ThemeColor.blue
        let bounds = self.navigationController!.navigationBar.bounds
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height*1.5)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width,height:80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
