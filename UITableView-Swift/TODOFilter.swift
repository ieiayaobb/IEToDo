//
//  TODOFilter.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/27.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class TODOFilter: UIButton {
    var todoLabel:UILabel!
    var allLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func drawRect(frame: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        
        self.backgroundColor = UIColor.blackColor()
        
        CGContextSetLineWidth(ctx, 2.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextMoveToPoint(ctx, 0, 0)
        CGContextAddLineToPoint(ctx, bounds.width, 0)
        CGContextAddLineToPoint(ctx, bounds.width, bounds.height)
        CGContextAddLineToPoint(ctx, 0, bounds.height)
        CGContextAddLineToPoint(ctx, 0, 0)
        CGContextStrokePath(ctx)
        
        addLabel()
        
        super.drawRect(frame)
    }
    
    func addLabel(){
        todoLabel = UILabel(frame: CGRectMake(0, 0, bounds.width / 2, bounds.height))
        todoLabel.textColor = UIColor.whiteColor()
        todoLabel.text = "TODO"
        allLabel = UILabel(frame: CGRectMake(bounds.width / 2, 0, bounds.width / 2, bounds.height))
        allLabel.textColor = UIColor.whiteColor()
        allLabel.text = "ALL"
        self.addSubview(todoLabel)
        self.addSubview(allLabel)
    }
}