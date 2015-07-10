//
//  BackgroundLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/28.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class BackgroundLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
        CGContextMoveToPoint(ctx, 0, 0)
        CGContextAddLineToPoint(ctx, frame.width, 0)
        CGContextAddLineToPoint(ctx, frame.width, frame.height)
        CGContextAddLineToPoint(ctx, 0, frame.height)
        CGContextAddLineToPoint(ctx, 0, 0)
        CGContextFillPath(ctx)
    }
}
