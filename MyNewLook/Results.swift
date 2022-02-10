//
//  Results.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/09.
//

import UIKit
import RealmSwift

class Results: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var count: Bool = false
    @objc dynamic var date = Date()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(name: String, count: Bool, date: Date) {
        self.init()
        self.name = name
        self.count = count
        self.date = date
    }
}
