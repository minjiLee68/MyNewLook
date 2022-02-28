//
//  AppDelegate.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/03.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Realm Migration
//        let config = Realm.Configuration (
//
//            //새로운 스키마 버전을 셋팅한다. 이 값은 이전에 사용했던 버전보다 반드시 커야 함
//            schemaVersion: 1,
//
//            // 셋팅한 스키마 버전보다 낮을 때 자동으로 호출되는 코드 블럭을 셋팅한다.
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion < 1) {
//                    migration.enumerateObjects(ofType: DataResults.className()) { oldObject, newObject in
//                        newObject![""] =
//                    }
//                }
//            })
//        // 새로운 설정을 기본 저장소에 사용
//        Realm.Configuration.defaultConfiguration = config
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

