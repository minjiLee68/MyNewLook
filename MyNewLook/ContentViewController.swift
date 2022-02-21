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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateInit()
    }
    
    func contentsText() {
        contents1.text = viewmodel.title1
        contents2.text = viewmodel.title2
        contents3.text = viewmodel.title3
    }

    @IBAction func checkBtn1(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmAdd(name: contents1.text!, check: check, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmUpdate(check: check, name: contents1.text!, date: picDay)
        }
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmAdd(name: contents2.text!, check: check, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmUpdate(check: check, name: contents2.text!, date: picDay)
        }
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        countData()
        if sender.isSelected == true {
            check = "true"
            checkCount += 1
            viewmodel.realmAdd(name: contents3.text!, check: check, date: picDay, count: checkCount)
        } else if sender.isSelected == false {
            check = "false"
            viewmodel.realmUpdate(check: check, name: contents3.text!, date: picDay)
        }
    }
}

extension ContentViewController {
    func countData() {
        checkCount = viewmodel.countDBSet(key: picDay) ?? 0
    }
    
    func picDate(name: String, check: String, count: Int) {
        let db = viewmodel.anyData(date: picDay)?.name
        if db != name {
            viewmodel.realmAdd(name: name, check: check, date: picDay, count: checkCount)
        }
    }
}

extension ContentViewController {
    func picDaySelected() {
        if picDay != "" {
            notPicDay.isHidden = true
            contents1.isHidden = false
            contents2.isHidden = false
            contents3.isHidden = false
            
            check1.isHidden = false
            check2.isHidden = false
            check3.isHidden = false
            
            v1.isHidden = false
            v2.isHidden = false
            v3.isHidden = false
        }
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
