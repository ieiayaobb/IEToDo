//
//  EmergencyLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/21.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import Foundation
import UIKit

class EmergencyLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        CGContextBeginPath(ctx)
        CGContextAddArc(ctx, position.x, position.y, bounds.width / 2 - 1, CGFloat(0.0), CGFloat(3 / 2 * M_PI), 0)
        CGContextAddLineToPoint(ctx, position.x, position.y)
        CGContextAddLineToPoint(ctx, position.x + 5, position.y)
        CGContextStrokePath(ctx)
    }
}
