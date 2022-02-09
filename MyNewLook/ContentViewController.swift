//
//  ContentViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var loveProgressbar: UIProgressView!
    @IBOutlet weak var moderationProgressbar: UIProgressView!
    @IBOutlet weak var thankProgressbar: UIProgressView!
    
    @IBOutlet weak var loveCount: UILabel!
    @IBOutlet weak var thankCount: UILabel!
    @IBOutlet weak var moderationCount: UILabel!
    
    @IBOutlet weak var lovePlus: UIButton!
    @IBOutlet weak var thankPlus: UIButton!
    @IBOutlet weak var moderationPlus: UIButton!
    
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loveData()
        thankData()
        moderationData()
        
        UserDefaults.standard.removeObject(forKey: "count1")
    }
    
    @IBAction func loveButton(_ sender: UIButton) {
        let love = UserDefaults.standard.integer(forKey: "count1")
        count1 = love + 1
        data1(count: count1)
        print("\(count1)")
        loveCount.text = String(count1)
        progressCount1(data1: count1)
    }
    
    @IBAction func thankButton(_ sender: UIButton) {
        let thank = UserDefaults.standard.integer(forKey: "count2")
        count2 = thank + 1
        data2(count: count2)
        thankCount.text = String(count2)
        progressCount2(data2: count2)
    }
    
    @IBAction func moderationButton(_ sender: UIButton) {
        let moderation = UserDefaults.standard.integer(forKey: "count3")
        count3 = moderation + 1
        data3(count: count3)
        moderationCount.text = String(count3)
        progressCount3(data3: count3)
    }
    
    func loveData() {
        let love = UserDefaults.standard.integer(forKey: "count1")
        loveCount.text = String(love)
        progressCount1(data1: love)
    }
    
    func thankData() {
        let thank = UserDefaults.standard.integer(forKey: "count2")
        thankCount.text = String(thank)
        progressCount2(data2: thank)
    }
    
    func moderationData() {
        let moderation = UserDefaults.standard.integer(forKey: "count3")
        moderationCount.text = String(moderation)
        progressCount3(data3: moderation)
    }
}

extension ContentViewController {
    func data1(count: Int) {
        UserDefaults.standard.set(count, forKey: "count1")
        UserDefaults.standard.set(count, forKey: "subCount1")
    }
    func data2(count: Int) {
        UserDefaults.standard.set(count, forKey: "count2")
        UserDefaults.standard.set(count, forKey: "subCount2")
    }
    func data3(count: Int) {
        UserDefaults.standard.set(count, forKey: "count3")
        UserDefaults.standard.set(count, forKey: "subCount3")
    }
}

extension ContentViewController {
    func progressCount1(data1: Int) {
        let progressCount = Float(data1) / 10
        
        loveProgressbar.progress = progressCount
        if progressCount > 1 {
            loveProgressbar.progress = 1
        }
    }
    
    func progressCount2(data2: Int) {
        let progressCount = Float(data2) / 10
        
        thankProgressbar.progress = progressCount
        if progressCount > 1 {
            thankProgressbar.progress = 1
        }
    }
    
    func progressCount3(data3: Int) {
        let progressCount = Float(data3) / 10
        
        moderationProgressbar.progress = progressCount
        if progressCount > 1 {
            moderationProgressbar.progress = 1
        }
    }
}
