//
//  StatsBackground.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
class StatsBackground: UIView {
    var axisColor:UIColor = UIColor.whiteColor()
    var chartMargin:CGFloat = 25.0

    var chartCavanWidth:CGFloat!

    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor.blackColor()
        
        xAxisWidth = 0.0
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var xAxisWidth:CGFloat!
    var yAxisHeight:CGFloat!
    override func drawRect(rect: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
        CGContextMoveToPoint(ctx, 5, 0)
        CGContextAddLineToPoint(ctx, frame.width - 5, 0)
        CGContextAddLineToPoint(ctx, frame.width - 5, frame.height)
        CGContextAddLineToPoint(ctx, 0, frame.height)
        CGContextAddLineToPoint(ctx, 5, 0)
        CGContextFillPath(ctx)
        
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, axisColor.CGColor)

        xAxisWidth = CGRectGetWidth(rect) - chartMargin/2.0

        // draw coordinate axis
        CGContextMoveToPoint(ctx, chartMargin, 25)
        CGContextAddLineToPoint(ctx, chartMargin, frame.size.height - 40)
        CGContextMoveToPoint(ctx, chartMargin, frame.size.height / 2)
        CGContextAddLineToPoint(ctx, xAxisWidth, frame.size.height / 2)
        CGContextStrokePath(ctx)

        super.drawRect(rect)
    }
}