//
//  MyNewLookViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import Foundation

class MyNewLookViewController: UIViewController {
    @IBOutlet weak var progressLove: UIProgressView!
    @IBOutlet weak var progressThank: UIProgressView!
    @IBOutlet weak var progressModeration: UIProgressView!
    
    @IBOutlet weak var lovePlus: UIButton!
    @IBOutlet weak var thankPlus: UIButton!
    @IBOutlet weak var moderationPlus: UIButton!
    
    @IBOutlet weak var loveCount: UILabel!
    @IBOutlet weak var thankCount: UILabel!
    @IBOutlet weak var moderationCount: UILabel!
    
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loveData()
        thankData()
        moderationData()
        dateInit()
    }
    
    @IBAction func LoveAddButton(_ sender: UIButton) {
        let love = UserDefaults.standard.integer(forKey: "count1")
        count1 = love + 1
        data1(count: count1)
        loveCount.text = String(count1)
        progressCount1(data1: count1)
    }
    
    @IBAction func thankAddButton(_ sender: UIButton) {
        let thank = UserDefaults.standard.integer(forKey: "count2")
        count2 = thank + 1
        data2(count: count2)
        thankCount.text = String(count2)
        progressCount2(data2: count2)
    }
    
    @IBAction func moderationAddButton(_ sender: UIButton) {
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
    
    func dateInit() {
        let tomorrow = Date(timeIntervalSinceNow: 60 * 60 * 24)
        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = dateFormatter.string(from: date)
        let tomorrowString = dateFormatter.string(from: tomorrow)

        if dateString == tomorrowString {
            UserDefaults.standard.removeObject(forKey: "count1")
            UserDefaults.standard.removeObject(forKey: "count2")
            UserDefaults.standard.removeObject(forKey: "count3")
        }
    }
}

extension MyNewLookViewController {
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

extension MyNewLookViewController {
    func progressCount1(data1: Int) {
        switch(data1) {
        case 0:
            progressLove.progress = 0
        case 1:
            progressLove.progress = 0.1
            progressLove.setProgress(0.1, animated: true)
        case 2:
            progressLove.progress = 0.2
            progressLove.setProgress(0.2, animated: true)
        case 3:
            progressLove.progress = 0.3
            progressLove.setProgress(0.3, animated: true)
        case 4:
            progressLove.progress = 0.4
            progressLove.setProgress(0.4, animated: true)
        case 5:
            progressLove.progress = 0.5
            progressLove.setProgress(0.5, animated: true)
        case 6:
            progressLove.progress = 0.6
            progressLove.setProgress(0.6, animated: true)
        case 7:
            progressLove.progress = 0.7
            progressLove.setProgress(0.7, animated: true)
        case 8:
            progressLove.progress = 0.8
            progressLove.setProgress(0.8, animated: true)
        case 9:
            progressLove.progress = 0.9
            progressLove.setProgress(0.9, animated: true)
        default:
            progressLove.progress = 1
            progressLove.setProgress(1, animated: true)
        }
    }
    
    func progressCount2(data2: Int) {
        switch(data2) {
        case 0:
            progressThank.progress = 0
        case 1:
            progressThank.progress = 0.1
            progressThank.setProgress(0.1, animated: true)
        case 2:
            progressThank.progress = 0.2
            progressThank.setProgress(0.2, animated: true)
        case 3:
            progressThank.progress = 0.3
            progressThank.setProgress(0.3, animated: true)
        case 4:
            progressThank.progress = 0.4
            progressThank.setProgress(0.4, animated: true)
        case 5:
            progressThank.progress = 0.5
            progressThank.setProgress(0.5, animated: true)
        case 6:
            progressThank.progress = 0.6
            progressThank.setProgress(0.6, animated: true)
        case 7:
            progressThank.progress = 0.7
            progressThank.setProgress(0.7, animated: true)
        case 8:
            progressThank.progress = 0.8
            progressThank.setProgress(0.8, animated: true)
        case 9:
            progressThank.progress = 0.9
            progressThank.setProgress(0.9, animated: true)
        default:
            progressThank.progress = 1
            progressThank.setProgress(1, animated: true)
        }
    }
    
    func progressCount3(data3: Int) {
        switch(data3) {
        case 0:
            progressModeration.progress = 0
        case 1:
            progressModeration.progress = 0.1
            progressModeration.setProgress(0.1, animated: true)
        case 2:
            progressModeration.progress = 0.2
            progressModeration.setProgress(0.2, animated: true)
        case 3:
            progressModeration.progress = 0.3
            progressModeration.setProgress(0.3, animated: true)
        case 4:
            progressModeration.progress = 0.4
            progressModeration.setProgress(0.4, animated: true)
        case 5:
            progressModeration.progress = 0.5
            progressModeration.setProgress(0.5, animated: true)
        case 6:
            progressModeration.progress = 0.6
            progressModeration.setProgress(0.6, animated: true)
        case 7:
            progressModeration.progress = 0.7
            progressModeration.setProgress(0.7, animated: true)
        case 8:
            progressModeration.progress = 0.8
            progressModeration.setProgress(0.8, animated: true)
        case 9:
            progressModeration.progress = 0.9
            progressModeration.setProgress(0.9, animated: true)
        default:
            progressModeration.progress = 1
            progressModeration.setProgress(1, animated: true)
        }
    }
}
