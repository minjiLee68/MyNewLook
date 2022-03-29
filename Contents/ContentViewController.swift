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
    @IBOutlet weak var notPicDay: UILabel!
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    
    var check: String = ""
    var date: String = ""
    var count: Int = 0
    var checkCount: Int = 0
    var picDay: String = ""
    
    let viewmodel = RealmResultViewModel.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentsText()
        datePickerCount()
        
        if picDay == "" {
            picDay = date
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateInit()
    }
    
    func contentsText() {
        let ud = UserDefaults.standard
        if let title1 = ud.string(forKey: "title1") {
            contents1.text = title1
        }
        if let title2 = ud.string(forKey: "title2") {
            contents2.text = title2
        }
        if let title3 = ud.string(forKey: "title3") {
            contents3.text = title3
        }
    }

    @IBAction func checkBtn1(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmData(check: check, name: contents1.text!, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmData(check: check, name: contents1.text!, date: picDay, count: checkCount)
        }
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmData(check: check, name: contents2.text!, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmData(check: check, name: contents2.text!, date: picDay, count: checkCount)
        }
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmData(check: check, name: contents3.text!, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmData(check: check, name: contents3.text!, date: picDay, count: checkCount)
        }
    }
    
    func datePickerCount() {
        viewmodel.fetchObject(date: date, title1: contents1.text!, title2: contents2.text!, title3: contents3.text!)
    
        if viewmodel.data1?.date == date {
            let check1 = viewmodel.data1?.check ?? "false"
            self.check1.isSelected = Bool(check1)!
        } else {
            self.check1.isSelected = false
        }
        
        if viewmodel.data2?.date == date {
            let check2 = viewmodel.data2?.check ?? "false"
            self.check2.isSelected = Bool(check2)!
        } else {
            self.check2.isSelected = false
        }
        
        if viewmodel.data3?.date == date {
            let check3 = viewmodel.data3?.check ?? "false"
            self.check3.isSelected = Bool(check3)!
        } else {
            self.check3.isSelected = false
        }
    }
}

extension ContentViewController {
    func countData() {
        checkCount = viewmodel.countDBSet(key: picDay) ?? 0
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
