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
    @objc dynamic var count: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
