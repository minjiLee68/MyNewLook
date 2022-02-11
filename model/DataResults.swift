//
//  DataResults.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/12.
//

import UIKit
import RealmSwift

class DataResults: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var count: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var day: Int = 0
}
