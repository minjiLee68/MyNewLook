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
    
//    func fileterObject(what date: String) -> Results<DataResults>? {
//        guard let data = result else { return nil }
//
//        let object = data.filter("date = %@", date)
//
//        return object
//    }
    
    func realmUpdate(check: String, name: String, count: Int) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", name)).first {
            try! realm.write {
                data1.check = check
                data1.count = count
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
    
//    func titleDB(own title: String, two title2: String, three title3: String) {
//        UserDefaults.standard.set(title, forKey: "title1")
//        UserDefaults.standard.set(title2, forKey: "title2")
//        UserDefaults.standard.set(title3, forKey: "title3")
//    }
//    
//    var title1: String = {
//        return UserDefaults.standard.string(forKey: "title1")
//    }() ?? "nil"
//    
//    var title2: String = {
//        return UserDefaults.standard.string(forKey: "title2")
//    }() ?? "nil"
//    
//    var title3: String = {
//        return UserDefaults.standard.string(forKey: "title3")
//    }() ?? "nil"
    
    func contents(name: String, date: String, check: String, count: Int) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        content.count = count
        return content
    }
}
