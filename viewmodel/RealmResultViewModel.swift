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
        data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title1, date)).first
        data2 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title2, date)).first
        data3 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title3, date)).first
        print("\(data1?.check ?? "nil")")
    }
    
    func fileterObject(what date: String) -> DataResults? {
        let data = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return data
    }
    
    func realmUpdate(check: String, name: String, date: String) {
        dataManager.realmUpdate(check: check, name: name, date: date)
    }
    
    func countDBSet(key date: String) -> Int? {
        let countDB = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return countDB?.count
    }
    
    func titleDB(own title: String, two title2: String, three title3: String, isTitle: Bool) {
        UserDefaults.standard.set(title, forKey: "title1")
        UserDefaults.standard.set(title2, forKey: "title2")
        UserDefaults.standard.set(title3, forKey: "title3")
        UserDefaults.standard.set(isTitle, forKey: "isTitle")
    }
    
    func anyData(date: String) -> DataResults? {
        let anyDay = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date))
        return anyDay.first
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
    
    var isTitle: Bool = {
        return UserDefaults.standard.bool(forKey: "isTitle")
    }()
    
    func contents(name: String, date: String, check: String, count: Int) -> DataResults {
        dataManager.contents(name: name, date: date, check: check, count: count)
    }
}
extension Notification.Name {
    static let authStateTitle = NSNotification.Name("authStateTitle")
}

