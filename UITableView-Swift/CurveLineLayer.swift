//
//  CurveLine.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/19.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit
import Darwin

class CurveLineLayer: CALayer {
    override func drawInContext(ctx: CGContext) {
        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        let mouthStart = CGPointMake(0, 0)
        var mouthEnd: CGPoint = mouthStart
        mouthEnd.x += self.bounds.size.width
        var mouthCP1: CGPoint = mouthStart
        mouthCP1.x += self.bounds.size.width * 1/3
        var  mouthCP2: CGPoint = mouthEnd
        mouthCP2.x -= self.bounds.size.width * 1/3
        
        mouthCP1.y += self.bounds.size.height
        mouthCP2.y += self.bounds.size.height
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, mouthStart.x, mouthStart.y)
        CGContextAddCurveToPoint(ctx, mouthCP1.x, mouthCP1.y, mouthCP2.x, mouthCP2.y, mouthEnd.x, mouthEnd.y)	// bezier curve
        CGContextStrokePath(ctx)
        
        self.anchorPoint = CGPoint(x: 0.5, y: -0.5 * sqrt(3))
//        self.position.y += smileOffset
        
//        drawCircleAtPoint(mouthCP1, withRadius: 1, inContext: ctx)
//        drawCircleAtPoint(mouthCP2, withRadius: 1, inContext: ctx)
    }
    
    func drawCircleAtPoint(p: CGPoint, withRadius r: CGFloat, inContext context: CGContextRef) {
        UIGraphicsPushContext(context)
        
        CGContextBeginPath(context)
        CGContextAddArc(context, p.x, p.y, r, CGFloat(0.0), CGFloat(2 * M_PI), 1)
        CGContextStrokePath(context)
        
        UIGraphicsPopContext()
    }

}
