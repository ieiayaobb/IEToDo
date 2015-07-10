//
// Created by 沈一能 on 15/1/23.
// Copyright (c) 2015 YANGReal. All rights reserved.
//

import UIKit

class EventTag:UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(frame: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        CGContextSetLineWidth(ctx, 1.0)
        CGContextSetFillColorWithColor(ctx, UIColor.whiteColor().CGColor)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)

        CGContextMoveToPoint(ctx, 0, 10)
        CGContextAddLineToPoint(ctx, 10, 0)
        CGContextAddLineToPoint(ctx, frame.width, 0)
        CGContextAddLineToPoint(ctx, frame.width, frame.height)
        CGContextAddLineToPoint(ctx, 10, frame.height)
        CGContextFillPath(ctx)

        super.drawRect(frame)
    }
}
