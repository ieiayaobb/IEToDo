//
//  StatsLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class StatsLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetFillColorWithColor(ctx, UIColor.whiteColor().CGColor)
        CGContextFillRect(ctx, CGRectMake(4, 10, 8, 20))
        CGContextFillRect(ctx, CGRectMake(16, 5, 8, 25))
        CGContextFillRect(ctx, CGRectMake(28, 0, 8, 30))
        
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, 0, 30)
        CGContextAddLineToPoint(ctx, 100, 30)
        CGContextStrokePath(ctx)

    }
}