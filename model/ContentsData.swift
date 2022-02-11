//
//  ContentsData.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/11.
//

import UIKit
import RealmSwift

class ContentsData: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var count: String = ""
    @objc dynamic var date: String = ""
}
