//
//  StatsData.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/28.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
import CoreData

class StatsData: UIView {
    var color:UIColor!
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, color: UIColor)
    {
        super.init(frame: frame)
        self.color = color
    }
    
    override func drawRect(rect: CGRect) {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        CGContextSetFillColorWithColor(ctx, self.color.CGColor)
        
        CGContextFillRect(ctx, rect)
        
        super.drawRect(rect)

    }
}
