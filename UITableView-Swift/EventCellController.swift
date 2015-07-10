//
//  EventCellController.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/7.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class EventCellController : UITableViewCell{

    var content: UITextField!
    let checkbox = UICheckbox(frame: CGRectMake(20, 10, 30, 30))
    
    let emeSlider = Slider(frame: CGRectMake(200, 50, 80, 20))
    let impSlider = Slider(frame: CGRectMake(50, 50, 80, 20))
    
    let imp = Important(frame: CGRectMake(20, 50, 25, 25))
    let eme = Emergency(frame: CGRectMake(170, 50, 25, 25))
    
    var event:Event!
    
    var indexPath: NSIndexPath!
    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.blackColor()
    }
    
    func initData(event:Event, indexPath: NSIndexPath){
        self.event = event
        self.indexPath = indexPath
        
        content = UITextField(frame: CGRectMake(100, 0, 200, 40))
        content.textColor = UIColor.whiteColor()
        content.text = event.content;
        content.addTarget(self, action: "contentValueChanged", forControlEvents: UIControlEvents.EditingDidEnd)
        
        checkbox.setChecked(event.isDone)
        
        emeSlider.currentValue = Double(event.eme)
        impSlider.currentValue = Double(event.imp)
        
        emeSlider.addTarget(self, action: "emeRangeValueChanged:", forControlEvents: .TouchUpInside)
        impSlider.addTarget(self, action: "impRangeValueChanged:", forControlEvents: .TouchUpInside)
        
        self.contentView.addSubview(content)
        
        checkbox.addTarget(self, action: "onCheckboxClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(checkbox)
        
        self.contentView.addSubview(emeSlider)
        self.contentView.addSubview(impSlider)
        
        self.contentView.addSubview(imp)
        self.contentView.addSubview(eme)
        
        self.layer.cornerRadius = 10.0
    }
    
    func contentValueChanged(){
        let targetEvent = self.cdh.fetchEventWithId(self.event.id) as Event
        targetEvent.content = content.text!
        do {
            try self.cdh.managedObjectContext?.save()
        } catch _ {
        }
    }
    
    override func drawRect(frame: CGRect) {
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        UIGraphicsPushContext(ctx)
        
        CGContextSetFillColorWithColor(ctx, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor)
        CGContextMoveToPoint(ctx, 5, 5)
        CGContextAddLineToPoint(ctx, frame.width - 5, 5)
        CGContextAddLineToPoint(ctx, frame.width - 5, frame.height - 5)
        CGContextAddLineToPoint(ctx, 5, frame.height - 5)
        CGContextAddLineToPoint(ctx, 5, 5)
        CGContextFillPath(ctx)
        
        CGContextSetLineWidth(ctx, 2.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.whiteColor().CGColor)
        CGContextMoveToPoint(ctx, 100, 40)
        CGContextAddLineToPoint(ctx, 300, 40)
        CGContextStrokePath(ctx)
        
        super.drawRect(frame)
    }
    
    func onButtonClick(sender: UIButton!) {
        print("+++")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var cdstore: CoreDataStore = {
        let cdstore = CoreDataStore()
        return cdstore
        }()
    
    lazy var cdh: CoreDataHelper = {
        let cdh = CoreDataHelper()
        return cdh
        }()
    
    func impRangeValueChanged(slider: Slider) {
        print("IMP Range slider value changed: (\(impSlider.currentValue))")
        let targetEvent = self.cdh.fetchEventWithId(self.event.id) as Event
        targetEvent.imp = Float(impSlider.currentValue)
        do {
            try self.cdh.managedObjectContext?.save()
        } catch _ {
        }
    }
    
    func emeRangeValueChanged(slider: Slider) {
        print("EME Range slider value changed: (\(emeSlider.currentValue))")
        let targetEvent = self.cdh.fetchEventWithId(self.event.id) as Event
        targetEvent.eme = emeSlider.currentValue
        do {
            try self.cdh.managedObjectContext?.save()
        } catch _ {
        }
    }
    
    func onCheckboxClick(checkbox: UICheckbox){
        let targetEvent = self.cdh.fetchEventWithId(self.event.id) as Event
        targetEvent.isDone = self.checkbox.status
        do {
            try self.cdh.managedObjectContext?.save()
        } catch _ {
        }
    }
}
