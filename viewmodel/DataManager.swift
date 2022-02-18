//
//  DataManager.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/16.
//

import UIKit
import RealmSwift

class DataManager {
    static let shared = DataManager()
    
    var realm: Realm
    var result: Results<DataResults>?
    
    var data1: DataResults?
    var data2: DataResults?
    var data3: DataResults?
    var notificationToken: NotificationToken?
    
    private init() {
        realm = try! Realm()
        result = realm.objects(DataResults.self)
    }
    
    func realmAdd(name: String, check: String, date: String, count: Int) {
        let mainData = self.contents(name: name, date: date, check: check, count: count)
        
        try! self.realm.write {
            self.realm.add(mainData)
            print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
        }
    }

    func realmUpdate(check: String, name: String) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", name)).first {
            try! realm.write {
                data1.check = check
                data1.count -= 1
            }
        }
    }
    
    func countDB(count: Int) {
        UserDefaults.standard.set(count, forKey: "count")
    }
    
    func countDBSet(key defaultName: String) -> Int? {
        let count = UserDefaults.standard.integer(forKey: defaultName)
        return count
    }

    func contents(name: String, date: String, check: String, count: Int) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        content.count = count
        return content
    }
}

extension Notification.Name {
    static let observer = Notification.Name("observer")
}
