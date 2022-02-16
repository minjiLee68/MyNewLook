//
//  RealmResultViewModel.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/11.
//

import UIKit
import Foundation
import RealmSwift

class RealmResultViewModel {
    private init() {}
    
    static let shared = RealmResultViewModel()
    var check: String = ""
    var count: Int = 0
    var title: String = ""
    
    var realm = try! Realm()
    let dataManager = DataManager.shared
    
    func realmAdd(name: String, check: String, date: String, count: Int) {
        let mainData = self.contents(name: name, date: date, count: count, check: check)
        
        try! self.realm.write {
            self.realm.add(mainData)
            print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
        }
    }
    
    func fetchObject(date: String) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).first {
            try! realm.write {
                check = data1.check
                count = data1.count
                title = data1.name
                print("\(check) \(count)")
            }
        }
    }
    
    func realmUpdate(counts: Int, check: String, name: String) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", name)).first {
            try! realm.write {
                data1.count = counts
                data1.check = check
            }
        }
    }
    
    func dataNotification() {
        dataManager.receiveRealmNotification()
    }
    
    func contents(name: String, date: String, count: Int, check: String) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        content.count = count
        return content
    }
}
