//
//  Important.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/18.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import UIKit

class Important:UIView {    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        let curveLineLayer = CurveLineLayer()
        curveLineLayer.frame = CGRectMake(0, 10, 20, 5)
        curveLineLayer.setNeedsDisplay()
        layer.addSublayer(curveLineLayer)
        
        let curveLineLayer2 = CurveLineLayer()
        curveLineLayer2.frame = CGRectMake(0, 10, 20, 5)
        curveLineLayer2.setNeedsDisplay()
        curveLineLayer2.transform = CATransform3DRotate(curveLineLayer2.transform, CGFloat(-M_PI / 3 * 2), 0.0, 0.0, 1.0)
        layer.addSublayer(curveLineLayer2)
        
        let curveLineLayer3 = CurveLineLayer()
        curveLineLayer3.frame = CGRectMake(0, 10, 20, 5)
        curveLineLayer3.setNeedsDisplay()
        curveLineLayer3.transform = CATransform3DRotate(curveLineLayer3.transform, CGFloat(M_PI / 3 * 2), 0.0, 0.0, 1.0)
        layer.addSublayer(curveLineLayer3)
        
        let emeSymbol = ImpSymbolLayer()
        emeSymbol.frame = CGRectMake(9, 8, 4, 10)
        emeSymbol.setNeedsDisplay()
        layer.addSublayer(emeSymbol)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
