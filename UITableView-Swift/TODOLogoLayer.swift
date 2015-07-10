//
//  TODOLogoLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class TODOLogoLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetFillColorWithColor(ctx, UIColor.whiteColor().CGColor)
        CGContextFillRect(ctx, CGRectMake(0, 0, 10, 10))
        CGContextFillRect(ctx, CGRectMake(0, 15, 10, 10))
        CGContextFillRect(ctx, CGRectMake(0, 30, 10, 10))
        
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, 15, 5)
        CGContextAddLineToPoint(ctx, 50, 5)
        CGContextMoveToPoint(ctx, 15, 20)
        CGContextAddLineToPoint(ctx, 50, 20)
        CGContextMoveToPoint(ctx, 15, 35)
        CGContextAddLineToPoint(ctx, 50, 35)
        CGContextStrokePath(ctx)
    }
}
