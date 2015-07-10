//
//  Emergency.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/18.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class Emergency: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)

        backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        let emergencyLayer = EmergencyLayer()
        emergencyLayer.frame = CGRectMake(0, 0, 20, 20)
        emergencyLayer.setNeedsDisplay()
        layer.addSublayer(emergencyLayer)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}