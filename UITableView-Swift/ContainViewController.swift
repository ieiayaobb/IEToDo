//
//  ContainViewController.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/9.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import Foundation
//
//  YRMainViewController.swift
//  JokeClient-Swift
//
//  Created by YANGReal on 14-6-5.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit

class ContainViewController: UITabBarController {
    
    var switchTabbar :UIView?
    var slider :UIView?
    
    var rect = UIScreen.mainScreen().bounds
    var eachWidth :CGFloat!
    var tabHeight :CGFloat = 40

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
        initViewControllers()
        self.setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
    }
    
    func setupViews()
    {
        eachWidth = rect.width / 3
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.blackColor()
        self.tabBar.hidden = true
        let height = self.view.frame.size.height
        
        self.switchTabbar = UIView(frame: CGRectMake(0, height - tabHeight,rect.width, tabHeight))
        self.switchTabbar!.backgroundColor = UIColor.blackColor()
        self.slider = UIView(frame:CGRectMake(0, 0, eachWidth, tabHeight))
        self.slider!.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        self.switchTabbar!.addSubview(self.slider!)
        
        self.view.addSubview(self.switchTabbar!)
        
        let todoNaviButton = TODONaviButton(frame: CGRectMake(0, 10, eachWidth, tabHeight))
        todoNaviButton.selected = true
        todoNaviButton.tag = 100
        todoNaviButton.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.switchTabbar?.addSubview(todoNaviButton)
        let slideButton = SlideButton(frame: CGRectMake(eachWidth, 10, eachWidth, tabHeight))
        slideButton.tag = 101
        slideButton.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.switchTabbar?.addSubview(slideButton)
        let statsButton = StatsButton(frame: CGRectMake(eachWidth * 2, 10, eachWidth, tabHeight))
        statsButton.tag = 102
        statsButton.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.switchTabbar?.addSubview(statsButton)
    }
    
    var vc1:UIViewController!
    var vc2:UIViewController!
    var vc3:UIViewController!
    
    func initViewControllers()
    {
        vc1 = TODOViewController()
        vc2 = SettingsViewController()
        vc3 = StatisticViewController()
        self.viewControllers = [vc1,vc2,vc3]
        
        self.view.backgroundColor = UIColor(red: 0 / 255.0 , green: 0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    }
    
    
    func tabBarButtonClicked(sender:UIButton)
    {
        let index = sender.tag
        
        for var i = 0;i < 3;i++
        {
            let button = self.view.viewWithTag(i + 100) as! UIButton
            if button.tag == index
            {
                button.selected = true
            }
            else
            {
                button.selected = false
            }
        }
        
        UIView.animateWithDuration( 0.3,
           animations:  {
                
                self.slider!.frame = CGRectMake(CGFloat(index - 100) * self.eachWidth, 0, self.eachWidth, self.tabHeight)
                
        })

        self.selectedIndex = index - 100
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        //  UIView.animationw
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
