//
//  OperationBar.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/27.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class OperationBar:UIView {
    var addButton:AddButton
    var todoFilter:TODOFilter
    override init(frame: CGRect){
        addButton = AddButton(frame: CGRectMake(240, 20, 20, 20))
        todoFilter = TODOFilter(frame: CGRectMake(20, 20, 100, 20))
        super.init(frame: frame)
        
        self.addSubview(addButton)
        self.addSubview(todoFilter)
    }
    
    override func drawRect(frame: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
    
        backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
        CGContextMoveToPoint(ctx, 5, 5)
        CGContextAddLineToPoint(ctx, frame.width - 5, 5)
        CGContextAddLineToPoint(ctx, frame.width - 5, frame.height - 5)
        CGContextAddLineToPoint(ctx, 5, frame.height - 5)
        CGContextAddLineToPoint(ctx, 5, 5)
        CGContextFillPath(ctx)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
