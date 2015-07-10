//
//  EmeSymbol.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/21.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
class ImpSymbolLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        CGContextSetLineWidth(ctx, bounds.width)

        CGContextMoveToPoint(ctx, 0, 0)
        CGContextAddLineToPoint(ctx, 0, 6)
        CGContextStrokePath(ctx)
        
        CGContextBeginPath(ctx)
        CGContextAddArc(ctx, -2, 12 , 3, CGFloat(0.0), CGFloat(2 * M_PI), 1)
        CGContextStrokePath(ctx)
    }
}