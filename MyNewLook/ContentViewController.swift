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
    
    var check: String = ""
    var count: Int = 0
    var date: String = ""
    let viewmodel = RealmResultViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(contentObserver(_:)), name: .observer, object: nil)
        
        contentsText()
        dateInit()
        viewUpdate()
    }
    
    func contentsText() {
        let text1 = UserDefaults.standard.string(forKey: "contents1") ?? "Title1"
        let text2 = UserDefaults.standard.string(forKey: "contents2") ?? "Title2"
        let text3 = UserDefaults.standard.string(forKey: "contents3") ?? "Title3"
        
        contents1.text = text1
        contents2.text = text2
        contents3.text = text3
    }
    
//    @objc func contentObserver(_ noti: Notification) {
//        OperationQueue.main.addOperation {
//        }
//    }
    
    @IBAction func checkBtn1(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true || count == 0 {
            check = "true"
            count += 1
            viewmodel.realmAdd(name: contents1.text!, check: check, date: date, count: count)
        } else if sender.isSelected == false || count != 0 {
            check = "false"
            count -= 1
            viewmodel.realmUpdate(counts: count, check: check, name: contents1.text!)
        }
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true || count == 0 {
            check = "true"
            count += 1
            viewmodel.realmAdd(name: contents2.text!, check: check, date: date, count: count)
        } else if sender.isSelected == false || count != 0 {
            count -= 1
            check = "false"
            viewmodel.realmUpdate(counts: count, check: check, name: contents2.text!)
        }
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true || count == 0 {
            count += 1
            check = "true"
            viewmodel.realmAdd(name: contents3.text!, check: check, date: date, count: count)
        } else if sender.isSelected == false || count != 0 {
            check = "false"
            count -= 1
            viewmodel.realmUpdate(counts: count, check: check, name: contents3.text!)
        }
    }
}

extension ContentViewController {
    func viewUpdate() {
        viewmodel.fetchObject(date: date)
    }
}

extension ContentViewController {
    func dateInit() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        dateFormatter.timeZone = TimeZone(identifier: "ko_KR")
        date = dateFormatter.string(from: Date())
    }
}
