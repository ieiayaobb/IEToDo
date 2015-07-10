//
//  Event.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/2/22.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import Foundation
import CoreData

@objc(Event)
class Event: NSManagedObject {

    @NSManaged var id: String
    @NSManaged var content: String
    @NSManaged var imp: NSNumber
    @NSManaged var eme: NSNumber
    @NSManaged var score: NSNumber
    @NSManaged var createdate: NSDate
    @NSManaged var finishdate: NSDate
    @NSManaged var isDone: NSNumber
    
    convenience init(insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        let entity = NSEntityDescription.entityForName("Event", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.content = ""
        self.imp = 0.5
        self.eme = 0.5
        self.isDone = false
    }
}
