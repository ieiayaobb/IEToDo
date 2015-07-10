//
//  EventDao.swift
//  UITableView-Swift
//
//  Created by 沈一能 on 15/1/10.
//  Copyright (c) 2015年 YANGReal. All rights reserved.
//

import Foundation

class EventDao{
    var users:Query?
    var name:Expression<String>?
    var email:Expression<String>?
    var id:Expression<Int>?
    init(){

    }
    
    func create(){
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first as String
        
        println(path)
    
        let db = Database("\(path)test.sqlite3")

        users = db["users"]
        id = Expression<Int>("id")
        name = Expression<String>("name")
        email = Expression<String>("email")
        
        db.create(table: users!, temporary: false, ifNotExists: true) { t in
            t.column(self.id!, primaryKey: true)
            t.column(self.name!)
            t.column(self.email!, unique: true)
        }
    }
    
    func insert(){
        var alice: Query?

        if let insertedID = self.users!.insert(name! <- "Alice", email! <- "alice@mac.com") {
            println("inserted id: \(insertedID)")
            // inserted id: 1
            alice = users!.filter(id! == insertedID)
        }
    }
    
    func search(){
        for user in self.users! {
            println("id: \(user[id!]), name: \(user[name!]), email: \(user[email!])")
        }
    }
}