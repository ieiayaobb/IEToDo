//
// Created by 沈一能 on 15/1/22.
// Copyright (c) 2015 YANGReal. All rights reserved.
//

import UIKit
import CoreData

class Coordinate: UIView {
    let imp = Important(frame: CGRectMake(10, 0, 25, 25))
    let eme = Emergency(frame: CGRectMake(290, 287, 25, 25))
    
    var axisColor:UIColor = UIColor.whiteColor()
    var chartMargin:CGFloat = 20.0
    
    var xAxisWidth:CGFloat!
    var yAxisHeight:CGFloat!

    override init(frame: CGRect){
        super.init(frame: frame)

        backgroundColor = UIColor.blackColor()
        
        self.addSubview(imp)
        self.addSubview(eme)
    }
    
    lazy var cdstore: CoreDataStore = {
        let cdstore = CoreDataStore()
        return cdstore
        }()
    
    lazy var cdh: CoreDataHelper = {
        let cdh = CoreDataHelper()
        return cdh
        }()
    
    func setData()
    {
        var error: NSError? = nil
        let fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        
        var result: [AnyObject]?
        do {
            result = try self.cdh.managedObjectContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        for resultItem in result! {
            let eventItem = resultItem as! Event
            let xpos = xAxisWidth * CGFloat(eventItem.eme)
            let ypos = yAxisHeight * (1 - CGFloat(eventItem.imp))
            let eventTag:EventTag = EventTag(frame: CGRectMake(xpos, ypos, 80, 20))
            self.addSubview(eventTag)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect)
    {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
        CGContextMoveToPoint(ctx, 5, 0)
        CGContextAddLineToPoint(ctx, frame.width - 5, 0)
        CGContextAddLineToPoint(ctx, frame.width - 5, frame.height)
        CGContextAddLineToPoint(ctx, 5, frame.height)
        CGContextAddLineToPoint(ctx, 5, 0)
        CGContextFillPath(ctx)

        CGContextSetLineWidth(ctx, 2)
        CGContextSetStrokeColorWithColor(ctx, axisColor.CGColor)

        xAxisWidth = frame.size.width - chartMargin * 2
        yAxisHeight = frame.size.height - chartMargin
        setData()

        // draw coordinate axis
        CGContextMoveToPoint(ctx, chartMargin, 0)
        CGContextAddLineToPoint(ctx, chartMargin, yAxisHeight)
        CGContextAddLineToPoint(ctx, xAxisWidth, yAxisHeight)
        CGContextStrokePath(ctx)

        super.drawRect(rect)
    }
}
