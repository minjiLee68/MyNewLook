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
    
    private init() {
//        let path = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.Way.Project")?.appendingPathComponent(".realm")
//        let config = Realm.Configuration(fileURL: path)
//        realm = try! Realm(configuration: config)
//        print("\(realm.configuration.fileURL)")
    }
    
    func fetchObject(date: String, title1: String, title2: String, title3: String) {
        data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title1, date)).first
        data2 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title2, date)).first
        data3 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@ AND date = %@", title3, date)).first
    }
    
    func fileterObject(what date: String) -> DataResults? {
        let data = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return data
    }
    
    func realmData(check: String, name: String, date: String, count: Int) {
        dataManager.realmData(check: check, name: name, date: date, count: count)
    }
    
    func countDBSet(key date: String) -> Int? {
        let countDB = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).last
        return countDB?.count
    }
    
//    func titleDB(own title: String, two title2: String, three title3: String, isTitle: Bool) {
//        let ud = UserDefaults.standard
//        ud.set(title, forKey: "title1")
//        ud.set(title2, forKey: "title2")
//        ud.set(title3, forKey: "title3")
//        ud.set(isTitle, forKey: "isTitle")
//    }
    
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
