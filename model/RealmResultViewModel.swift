//
//  RealmResultViewModel.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/11.
//

import UIKit
import RealmSwift

class RealmResultViewModel {
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func realmAdd(name: String, count: String, date: String, day: Int) {
        let data1 = self.contents(name: name, count: count, date: date, day: day)
        try! realm.write {
            realm.add(data1)
        }
        print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
    
    func realmUpdate(counts: String, date: String, day: Int) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).first {
            try! realm.write {
                data1.count = counts
            }
        }
    }
    
    func contents(name: String, count: String, date: String, day: Int) -> DataResults {
        let content = DataResults()
        content.name = name
        content.count = count
        content.date = date
        content.day = day
        
        return content
    }
}
