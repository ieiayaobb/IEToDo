//
//  Slider.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/9.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class Slider: UIControl {
    let trackLayer = SliderTrackLayer()
    let sliderThumbLayer = SliderThumbLayer()

    var previousLocation = CGPoint()
    
    var minimumValue: Double = 0.0 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var maximumValue: Double = 1.0 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var currentValue: Double = 0.2 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var trackTintColor: UIColor = UIColor(white: 1.0, alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    var trackHighlightTintColor: UIColor = UIColor(red: 0.0, green: 0.45, blue: 0.94, alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    var thumbTintColor: UIColor = UIColor.whiteColor() {
        didSet {
            sliderThumbLayer.setNeedsDisplay()
        }
    }
    
    var curvaceousness: CGFloat = 1.0 {
        didSet {
            trackLayer.setNeedsDisplay()
            sliderThumbLayer.setNeedsDisplay()
        }
    }
    
    var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sliderThumbLayer.slider = self
        
        trackLayer.slider = self
        trackLayer.contentsScale = UIScreen.mainScreen().scale
        layer.addSublayer(trackLayer)
        
        layer.addSublayer(sliderThumbLayer)
        
        updateLayerFrames()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        trackLayer.frame = bounds.rectByInsetting(dx: 0.0, dy: (bounds.height - 1) / 2)
        trackLayer.setNeedsDisplay()
        
        let currentThumbCenter = CGFloat(positionForValue(currentValue))
        
        sliderThumbLayer.frame = CGRect(x: currentThumbCenter - thumbWidth / 2.0, y: 0.0,
            width: thumbWidth, height: thumbWidth)
        sliderThumbLayer.setNeedsDisplay()

        CATransaction.commit()
    }
    
    func positionForValue(value: Double) -> Double {
        let widthDouble = Double(thumbWidth)
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }

    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        previousLocation = touch.locationInView(self)
        
        // Hit test the thumb layers
        if sliderThumbLayer.frame.contains(previousLocation) {
            sliderThumbLayer.highlighted = true
        }
        
        return sliderThumbLayer.highlighted
    }
    
    func boundValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let location = touch.locationInView(self)
        
        // 1. Determine by how much the user has dragged
        let deltaLocation = Double(location.x - previousLocation.x)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - bounds.height)
        
        previousLocation = location
        
        // 2. Update the values
        if sliderThumbLayer.highlighted {
            currentValue += deltaValue
            currentValue = boundValue(currentValue, toLowerValue: minimumValue, upperValue: maximumValue)
        }
        
        updateLayerFrames()
        
        sendActionsForControlEvents(.ValueChanged)
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        sliderThumbLayer.highlighted = false
    }
}
