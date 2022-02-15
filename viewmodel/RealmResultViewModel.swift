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
    
    var realm = try! Realm()
    
    func realmAdd(name: String, check: String, date: String, count: Int) {
        let mainData = self.contents(name: name, date: date, count: count, check: check)
        
        try! self.realm.write {
            self.realm.add(mainData)
            print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
        }
    }
    
    func dataDelete() {
        try! self.realm.write {
            self.realm.deleteAll()
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
    
    func contents(name: String, date: String, count: Int, check: String) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        content.count = count
        return content
    }
}
