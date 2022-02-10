//
//  ContentViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var check1: UIButton!
    @IBOutlet weak var check2: UIButton!
    @IBOutlet weak var check3: UIButton!
    
    @IBOutlet weak var contents1: UILabel!
    @IBOutlet weak var contents2: UILabel!
    @IBOutlet weak var contents3: UILabel!
    
    var count: Int = 0
    
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
            count += 1
        } else if sender.isSelected == false && count != 0 {
            count -= 1
        }
        print("\(String(count))")
    }
    
    @IBAction func checkBtn2(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count += 1
        } else if sender.isSelected == false && count != 0 {
            count -= 1
        }
        print("\(String(count))")
    }
    
    @IBAction func checkBtn3(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            count += 1
        } else if sender.isSelected == false && count != 0 {
            count -= 1
        }
        print("\(String(count))")
    }
}

