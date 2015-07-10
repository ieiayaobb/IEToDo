//
//  AppDelegate.swift
//  UITableView-Swift
//
//  Created by YANGRui on 14-6-4.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        print(123)
        // Override point for customization after application launch.
        
//        initDatabase()
        
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.cdh.saveContext()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.demo()
        let cvc = ContainViewController(nibName:nil,  bundle: nil)
        //        var nav = UINavigationController(rootViewController:cvc);
        let rect = UIScreen.mainScreen().bounds;
        self.window = UIWindow(frame: rect);
        self.window!.rootViewController = cvc;
        self.window?.makeKeyAndVisible();

    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.cdh.saveContext()
    }

    // #pragma mark - Core Data Helper
    
    lazy var cdstore: CoreDataStore = {
        let cdstore = CoreDataStore()
        return cdstore
        }()
    
    lazy var cdh: CoreDataHelper = {
        let cdh = CoreDataHelper()
        return cdh
        }()
    
    // #pragma mark - Demo
    
    func demo(){
        print("demo")
        fetchTestData()
    }
    func initTestData(){
        let event1:Event = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: self.cdh.backgroundContext!) as! Event
        event1.content = "陪马化腾吃饭"
        event1.eme = 0.7
        event1.imp = 0.5
        event1.isDone = 0
        NSLog("Inserted New Event for \(event1.content) ")
        
        let event2:Event = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: self.cdh.backgroundContext!)as! Event
        event2.content = "打一局Dota2"
        event2.eme = 0.1
        event2.imp = 0.2
        event2.isDone = 1
        NSLog("Inserted New Event for \(event2.content) ")
        self.cdh.saveContext(self.cdh.backgroundContext!)
        
    }
    func insert(){
        let newItemNames = ["Apples", "Milk", "Bread", "Cheese", "Sausages", "Butter", "Orange Juice", "Cereal", "Coffee", "Eggs", "Tomatoes", "Fish"]
        // add families
        NSLog(" ======== Insert ======== ")
        
        for newItemName in newItemNames {
            let newItem: Event = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: self.cdh.backgroundContext!) as! Event
            
            newItem.content = newItemName
            NSLog("Inserted New Event for \(newItemName) ")
        }
        
        self.cdh.saveContext(self.cdh.backgroundContext!)
    }
    
    func updateData(){
        var error: NSError? = nil
        let fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        
        var result:NSArray;
        do {
            try result = self.cdh.managedObjectContext?.executeFetchRequest(fReq) as! [Event]
            let eventItem = result[0] as! Event
            
            eventItem.eme = 0.0
            
            eventItem.isDone = true
        }catch{
            print(error)
        }
        
        
        do {
            //        self.cdh.saveContext()
            try self.cdh.managedObjectContext?.save()
        } catch _ {
        }
    }
    
    func fetchTestData(){
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
            NSLog("Fetched Event for \(eventItem.content) ")
        }

    }
    
    func deleteTestData(){
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        var error: NSError? = nil
        
        //delete families
        NSLog(" ======== Delete ======== ")
        
        fReq = NSFetchRequest(entityName: "Event")
        var result: [AnyObject]?
        do {
            result = try self.cdh.backgroundContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        
        for resultItem in result! {
            let eventItem = resultItem as! Event
            NSLog("Deleted Event for \(eventItem.content) ")
            self.cdh.backgroundContext?.deleteObject(eventItem)
        }
        
        self.cdh.saveContext(self.cdh.backgroundContext!)
    }
    
    func fetch(){
        //fetch families
        NSLog(" ======== Fetch ======== ")
        
        var error: NSError? = nil
        let fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        
        fReq.predicate = NSPredicate(format:"content CONTAINS 'B' ")
        
        let sorter: NSSortDescriptor = NSSortDescriptor(key: "content" , ascending: false)
        fReq.sortDescriptors = [sorter]
        
        fReq.returnsObjectsAsFaults = false
        
        var result: [AnyObject]?
        do {
            result = try self.cdh.managedObjectContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        for resultItem in result! {
            let eventItem = resultItem as! Event
            NSLog("Fetched Event for \(eventItem.content) ")
        }
    }
    
    func delete(){
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        var error: NSError? = nil
        
        //delete families
        NSLog(" ======== Delete ======== ")
        
        fReq = NSFetchRequest(entityName: "Event")
        var result: [AnyObject]?
        do {
            result = try self.cdh.backgroundContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        
        for resultItem in result! {
            let eventItem = resultItem as! Event
            NSLog("Deleted Event for \(eventItem.content) ")
            self.cdh.backgroundContext?.deleteObject(eventItem)
        }
        
        self.cdh.saveContext(self.cdh.backgroundContext!)
    }
    
    func checkDelete(){
        NSLog(" ======== Check Delete ======== ")
        let fReq: NSFetchRequest = NSFetchRequest(entityName: "Event")
        var error: NSError? = nil
        
        fReq.predicate = NSPredicate(format:"content CONTAINS 'B' ")
        
        var result: [AnyObject]?
        do {
            result = try self.cdh.managedObjectContext?.executeFetchRequest(fReq)
        } catch var error1 as NSError {
            error = error1
            result = nil
        }
        if result!.isEmpty {
            NSLog("Deleted All Events")
        }
        else{
            for resultItem in result! {
                let eventItem = resultItem as! Event
                NSLog("Fetched Error Event for \(eventItem.content) ")
            }
        }
    }
}

