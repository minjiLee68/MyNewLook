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
    
    var result: DataResults?
    var data1: DataResults?
    var data2: DataResults?
    var data3: DataResults?
    
    var realm = try! Realm()
    let dataManager = DataManager.shared
    
    func realmAdd(name: String, check: String, date: String) {
        let mainData = self.contents(name: name, date: date, check: check)
        
        try! self.realm.write {
            self.realm.add(mainData)
            print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
        }
    }
    
    func fetchObject(date: String, title1: String, title2: String, title3: String) {
        if let data = realm.objects(DataResults.self).filter(NSPredicate(format: "date = %@", date)).first {
            try! realm.write {
                result = data
                data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title1)).first
                data2 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title2)).first
                data3 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", title3)).first
                print("\(data.date)")
            }
        }
    }
    
    func realmUpdate(check: String, name: String) {
        if let data1 = realm.objects(DataResults.self).filter(NSPredicate(format: "name = %@", name)).first {
            try! realm.write {
                data1.check = check
            }
        }
    }
    
    func contents(name: String, date: String, check: String) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        return content
    }
}
