//
//  RightLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/21.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class RightLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, 0, 10)
        CGContextAddLineToPoint(ctx, 10, 20)
        CGContextAddLineToPoint(ctx, 20, 0)
        CGContextStrokePath(ctx)
    }
}