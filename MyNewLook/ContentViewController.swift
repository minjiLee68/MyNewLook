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
    var day: Int = 0
    let viewmodel = RealmResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsText()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "ko_KR")
        date = dateFormatter.string(from: Date())
        day = Calendar.current.component(.day, from: Date())
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
            viewmodel.realmAdd(name: contents1.text!, count: count, date: date, day: day)
        } else if sender.isSelected == false{
            count = "false"
        }
        
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count = "true"
            viewmodel.realmAdd(name: contents1.text!, count: count, date: date, day: day)
        } else if sender.isSelected == false{
            count = "false"
        }
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count = "true"
            viewmodel.realmAdd(name: contents1.text!, count: count, date: date, day: day)
        } else if sender.isSelected == false{
            count = "false"
        }
    }
}
