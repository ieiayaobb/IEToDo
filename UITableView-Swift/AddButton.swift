//
//  AddButton.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/23.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class AddButton: UIButton {
    var addLabel:UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel = UILabel(frame: CGRectMake(20, -5, 40, 30))
        addLabel.textColor = UIColor.whiteColor()
        addLabel.text = "Add"
        self.addSubview(addLabel)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawRect(frame: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        
        self.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        CGContextSetLineWidth(ctx, 2.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextMoveToPoint(ctx, 0, 10)
        CGContextAddLineToPoint(ctx, 20, 10)
        CGContextMoveToPoint(ctx, 10, 0)
        CGContextAddLineToPoint(ctx, 10, 20)
        CGContextStrokePath(ctx)
        
        CGContextBeginPath(ctx)
        CGContextAddArc(ctx, 10, 10, 9, CGFloat(0.0), CGFloat(2 * M_PI), 1)
        CGContextStrokePath(ctx)
        
        super.drawRect(frame)
    }
}
