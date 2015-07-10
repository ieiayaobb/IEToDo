//
//  TODONaviButton.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
class TODONaviButton: UIButton {
    var todoLogoLayer = TODOLogoLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawRect(frame: CGRect)
    {
        todoLogoLayer.frame = CGRectMake(30, 0, 40, 40)
        todoLogoLayer.setNeedsDisplay()
        layer.addSublayer(todoLogoLayer)
    }
}