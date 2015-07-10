//
//  ViewController.swift
//  UITableView-Swift
//
//  Created by YANGRui on 14-6-4.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit
import CoreData

class TODOViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource
{
//    @IBOutlet weak var tableView: UITableView!
    var event = [NSManagedObject]()
    
    //数据源
    var dataArr = NSMutableArray();
    //声明tableView
    var tableView :UITableView?;
    
    let CellId = "event";
    
    var tabHeight :CGFloat = 60
  
    //UITableViewDataSource 代理办法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        tableView.backgroundColor = UIColor.blackColor()
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None

        var cell = tableView.dequeueReusableCellWithIdentifier(CellId) as? EventCellController;
        if(cell == nil)
        {
            cell = EventCellController(style:.Default,reuseIdentifier:CellId);
        }
        
        var event:Event = dataArr.objectAtIndex(indexPath.row) as! Event
        cell?.initData(event, indexPath: indexPath)
//        cell.addTarget(self, action: "onCellClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell!;
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // 初始化数据
        setData();
        //设置布局
        setLayout();
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
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
                
        do {
            var result:NSArray

            try result = self.cdh.managedObjectContext?.executeFetchRequest(fReq) as! [Event]
            
            for resultItem in result {
                var eventItem = resultItem
                dataArr.addObject(eventItem)
            }

        } catch{
            print(error)
        }
    }
    
    //布局方法
    func setLayout()
    {
        var rect = self.view.bounds

        rect.offset(dx: 0, dy: 50);
        rect.size.height = rect.height - 120
        //  创建TableView
        tableView = UITableView(frame:rect, style:.Plain);
        // 设置代理
        tableView!.delegate=self;
        tableView!.dataSource=self;
        //添加视图
        self.view.addSubview(tableView!);
        
        let operationBar = OperationBar(frame: CGRectMake(0, 0, 320, 50))
        self.view.addSubview(operationBar)
        
        operationBar.addButton.addTarget(self, action: "onAddButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func onAddButtonClick(sender: UIButton!){
        let row = self.dataArr.count
        let indexPath = NSIndexPath(forRow:row,inSection:0)
        
        let newEvent: Event = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: self.cdh.backgroundContext!) as! Event
        
        newEvent.id = NSUUID().UUIDString
        newEvent.content = "new event"
        newEvent.eme = 0.5
        newEvent.imp = 0.5
        newEvent.isDone = false
        
        self.dataArr.addObject(newEvent)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        
        NSLog("Inserted New Event for \(newEvent) ")
        
        self.cdh.saveContext(self.cdh.backgroundContext!)
//        self.cdh.managedObjectContext?.save(nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

