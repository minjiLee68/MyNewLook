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
    
    var data1: DataResults?
    var data2: DataResults?
    var data3: DataResults?
    
    var realm = try! Realm()
    let dataManager = DataManager.shared
    
    func realmAdd(name: String, check: String, date: String, count: Int) {
        dataManager.realmAdd(name: name, check: check, date: date, count: count)
    }
    
    func fetchObject(date: String, title1: String, title2: String, title3: String) {
        if let data = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).first {
            try! realm.write {
                data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title1)).first
                data2 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title2)).first
                data3 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title3)).first
                print("\(data.date)")
            }
        }
    }
    
    func fileterObject(what date: String) -> DataResults? {
        let data = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return data
    }
    
    func realmUpdate(check: String, name: String) {
        dataManager.realmUpdate(check: check, name: name)
    }
    
    func countDBSet(key date: String) -> Int? {
        let countDB = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return countDB?.count
    }
    
    func titleDB(own title: String, two title2: String, three title3: String) {
        UserDefaults.standard.set(title, forKey: "title1")
        UserDefaults.standard.set(title2, forKey: "title2")
        UserDefaults.standard.set(title3, forKey: "title3")
    }
    
    var title1: String = {
        return UserDefaults.standard.string(forKey: "title1")
    }() ?? "Title1"
    var title2: String = {
        return UserDefaults.standard.string(forKey: "title2")
    }() ?? "Title2"
    
    var title3: String = {
        return UserDefaults.standard.string(forKey: "title3")
    }() ?? "Title3"
    
    func contents(name: String, date: String, check: String, count: Int) -> DataResults {
        dataManager.contents(name: name, date: date, check: check, count: count)
    }
}
