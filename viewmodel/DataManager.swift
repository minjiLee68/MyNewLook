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
    private var result: Results<DataResults>?
    private var realm: Realm?
    
    private var notificationToken: NotificationToken?
    
    private init() {
        realm = try? Realm()
        result = realm?.objects(DataResults.self)
    }
    
//    func receiveRealmNotification() {
//        guard let data = result else { return }
//        
//        notificationToken = data.observe { (changes: RealmCollectionChange) in
//            switch changes {
//                
//            case .error(let error):
//                print("noti error \(error)")
//                
//            case .initial(let results):
//                print("inital count: \(results.count)")
//                
//            case .update(_, let deletions, let insertions, let modifications):
//                print("nori update \(deletions) \(insertions) \(modifications)")
//                NotificationCenter.default.post(name: .observer, object: nil)
//            }
//        }
//    }
//    deinit {
//        notificationToken?.invalidate()
//    }
}

extension Notification.Name {
    static let observer = Notification.Name("dataObserver")
}
