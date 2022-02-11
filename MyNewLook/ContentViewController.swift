//
//  ContentViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit
import RealmSwift

class ContentViewController: UIViewController {
    @IBOutlet weak var check1: UIButton!
    @IBOutlet weak var check2: UIButton!
    @IBOutlet weak var check3: UIButton!
    
    @IBOutlet weak var contents1: UILabel!
    @IBOutlet weak var contents2: UILabel!
    @IBOutlet weak var contents3: UILabel!
    
    var count: String = ""
    var date: String = ""
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsText()
    }
    
    func contentsText() {
        let text1 = UserDefaults.standard.string(forKey: "contents1")
        let text2 = UserDefaults.standard.string(forKey: "contents2")
        let text3 = UserDefaults.standard.string(forKey: "contents3")
        
        contents1.text = text1 ?? "Title1"
        contents2.text = text2 ?? "Title2"
        contents3.text = text3 ?? "Title3"
    }
    
    @IBAction func checkBtn1(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count = "true"
            realmAdd(name: contents1.text!, count: count)
        } else if sender.isSelected == false{
            count = "false"
            realmUpdate(counts: count)
        }
        
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count = "true"
            realmAdd(name: contents2.text!, count: count)
        } else if sender.isSelected == false{
            count = "false"
            realmUpdate(counts: count)
        }
        
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count = "true"
            realmAdd(name: contents3.text!, count: count)
        } else if sender.isSelected == false{
            count = "false"
            realmUpdate(counts: count)
        }
    }
}

extension ContentViewController {
    func realmAdd(name: String, count: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "ko_KR")
        date = dateFormatter.string(from: Date())
        let data1 = self.contents(name: name, count: count, date: date)
        try! realm.write {
            realm.add(data1)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func realmUpdate(counts: String) {
        if let data1 = realm.objects(ContentsData.self).filter(NSPredicate(format: "date = %@", date)).first {
            try! realm.write {
                data1.count = counts
            }
        }
    }
}

extension ContentViewController {
    func contents(name: String, count: String, date: String) -> ContentsData {
        let content = ContentsData()
        content.name = name
        content.count = count
        content.date = date
        
        return content
    }
}

