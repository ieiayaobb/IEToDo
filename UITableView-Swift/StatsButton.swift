//
//  StatsButton.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class StatsButton: UIButton {
    var statsLayer = StatsLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawRect(frame: CGRect)
    {
        statsLayer.frame = CGRectMake(30, 0, 40, 40)
        statsLayer.setNeedsDisplay()
        layer.addSublayer(statsLayer)
    }
}