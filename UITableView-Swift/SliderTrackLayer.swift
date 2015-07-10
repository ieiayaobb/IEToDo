//
//  SliderTrackLayer.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/10.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class SliderTrackLayer: CALayer {
    weak var slider:Slider?
    
    override func drawInContext(ctx: CGContext) {
        if let slider = slider {
            // Clip
            let cornerRadius = bounds.height * slider.curvaceousness / 2.0
            let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            CGContextAddPath(ctx, path.CGPath)
            
            // Fill the track
            CGContextSetFillColorWithColor(ctx, slider.trackTintColor.CGColor)
            CGContextAddPath(ctx, path.CGPath)
            CGContextFillPath(ctx)
            
        }
    }
    
}
