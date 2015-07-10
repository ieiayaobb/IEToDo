//
//  StatisticViewController.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/11.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
import CoreData
import Darwin

class StatisticViewController: UIViewController {
    var impDic:Dictionary<NSNumber,Int>!
    var emeDic:Dictionary<NSNumber,Int>!
    
    var imp: Important!
    var eme: Emergency!
    
    var statsBackground:StatsBackground!
    
    override func viewWillAppear(animated: Bool) {
        impDic = Dictionary()
        emeDic = Dictionary()
        
        setData()
        
        for var i = 3;i < view.subviews.count;i++
        {
            view.subviews[i].removeFromSuperview()
        }
        
        for (key,value) in impDic{
            let offsetX = 25 + CGFloat(key) * 250
            let height = CGFloat(value) * 10
            let offsetY = 20 + statsBackground.frame.height / 2 - height
            
            let statsData:StatsData = StatsData(frame:CGRect(x: offsetX, y: offsetY, width: 15, height: height), color: UIColor.whiteColor())
            view.addSubview(statsData)
        }
        for (key,value) in emeDic{
            let offsetX = 25 + CGFloat(key) * 250
            let height = CGFloat(value) * 10
            let offsetY = 20 + statsBackground.frame.height / 2
            
            let statsData:StatsData = StatsData(frame:CGRect(x: offsetX, y: offsetY, width: 15, height: height), color: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0))
            view.addSubview(statsData)
        }
    }

    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        self.imp = Important(frame: CGRectMake(15, 20, 25, 25))
        self.eme = Emergency(frame: CGRectMake(15, 425, 25, 25))
        
        statsBackground = StatsBackground(frame: CGRectMake(0, 20, 320, 440))
        view.addSubview(statsBackground)
        
        view.addSubview(imp)
        view.addSubview(eme)
    }
    
    func collectData(event: Event){
        let numberFormatter:NSNumberFormatter = NSNumberFormatter()
        numberFormatter.positiveFormat = "0.#"
        let impKey = floor(CGFloat(event.imp) * 10) / 10
        
        if impDic[impKey] != nil
        {
            impDic[impKey] = impDic[impKey]! + 1
        }else{
            impDic[impKey] = 1
        }
        let emeKey = floor(CGFloat(event.eme) * 10) / 10
        if emeDic[emeKey] != nil
        {
            emeDic[emeKey] = emeDic[emeKey]! + 1
        }else{
            emeDic[emeKey] = 1
        }
    }
    
    lazy var cdstore: CoreDataStore = {
        let cdstore = CoreDataStore()
        return cdstore
        }()
    
    lazy var cdh: CoreDataHelper = {
        let cdh = CoreDataHelper()
        return cdh
        }()
    
    func setData()
    {
        var error: NSError? = nil
        let fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        
        var result: [AnyObject]?
        do {
            result = try self.cdh.managedObjectContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        for resultItem in result! {
            let eventItem = resultItem as! Event
            self.collectData(eventItem)
        }
    }
}
