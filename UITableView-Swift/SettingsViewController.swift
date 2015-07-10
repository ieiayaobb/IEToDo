//
//  SettingsViewController.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/9.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    let slider = Slider()
    
    var imp: Important!
    var eme: Emergency!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let backgroundLayer: BackgroundLayer = BackgroundLayer()
        backgroundLayer.frame = CGRectMake(5, 5, view.frame.width - 5 * 2, 120)
        backgroundLayer.setNeedsDisplay()
        self.view.layer.addSublayer(backgroundLayer)
        
        view.addSubview(slider)
        slider.addTarget(self, action: "rangeValueChanged:", forControlEvents: .ValueChanged)

        let coordinate = Coordinate(frame: CGRectMake(0, 135.0, 320, 320.0))
        view.addSubview(coordinate)
        
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 50.0
        let width = view.bounds.width - 2.0 * margin
        slider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length,
            width: width, height: 30.0)
        self.imp = Important(frame: CGRectMake(20, margin + topLayoutGuide.length, 25, 25))
        self.eme = Emergency(frame: CGRectMake(view.bounds.width - 30, margin + topLayoutGuide.length,
            25, 25))
        
        view.addSubview(imp)
        view.addSubview(eme)
    }
    
    func rangeValueChanged(slider: Slider) {
        print("Range slider value changed: (\(slider.currentValue))")
    }
}