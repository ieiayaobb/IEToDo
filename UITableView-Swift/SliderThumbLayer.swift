//
//  SliderThumbLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/9.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class SliderThumbLayer: CALayer {
    weak var slider: Slider?
    
    override func drawInContext(ctx: CGContext) {
        if let slider = slider {
            let thumbFrame = bounds.rectByInsetting(dx: 2.0, dy: 2.0)
            let cornerRadius = thumbFrame.height * slider.curvaceousness / 2.0
            let thumbPath = UIBezierPath(roundedRect: thumbFrame, cornerRadius: cornerRadius)
            
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
            CGContextFillPath(ctx)
            
            // Outline
            CGContextAddPath(ctx, thumbPath.CGPath)
            CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
            CGContextSetLineWidth(ctx, 2)
            CGContextStrokePath(ctx)
            
            if highlighted {
                CGContextSetFillColorWithColor(ctx, UIColor(white: 0.0, alpha: 0.1).CGColor)
                CGContextAddPath(ctx, thumbPath.CGPath)
                CGContextFillPath(ctx)
            }
        }
    }
    var highlighted: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
}
