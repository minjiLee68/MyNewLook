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
    }
    
    @IBAction func loveButton(_ sender: UIButton) {
        let love = UserDefaults.standard.integer(forKey: "count1")
        count1 = love + 1
        data1(count: count1)
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
        switch(data1) {
        case 0:
            loveProgressbar.progress = 0
        case 1:
            loveProgressbar.progress = 0.1
            loveProgressbar.setProgress(0.1, animated: true)
        case 2:
            loveProgressbar.progress = 0.2
            loveProgressbar.setProgress(0.2, animated: true)
        case 3:
            loveProgressbar.progress = 0.3
            loveProgressbar.setProgress(0.3, animated: true)
        case 4:
            loveProgressbar.progress = 0.4
            loveProgressbar.setProgress(0.4, animated: true)
        case 5:
            loveProgressbar.progress = 0.5
            loveProgressbar.setProgress(0.5, animated: true)
        case 6:
            loveProgressbar.progress = 0.6
            loveProgressbar.setProgress(0.6, animated: true)
        case 7:
            loveProgressbar.progress = 0.7
            loveProgressbar.setProgress(0.7, animated: true)
        case 8:
            loveProgressbar.progress = 0.8
            loveProgressbar.setProgress(0.8, animated: true)
        case 9:
            loveProgressbar.progress = 0.9
            loveProgressbar.setProgress(0.9, animated: true)
        default:
            loveProgressbar.progress = 1
            loveProgressbar.setProgress(1, animated: true)
        }
    }
    
    func progressCount2(data2: Int) {
        switch(data2) {
        case 0:
            thankProgressbar.progress = 0
        case 1:
            thankProgressbar.progress = 0.1
            thankProgressbar.setProgress(0.1, animated: true)
        case 2:
            thankProgressbar.progress = 0.2
            thankProgressbar.setProgress(0.2, animated: true)
        case 3:
            thankProgressbar.progress = 0.3
            thankProgressbar.setProgress(0.3, animated: true)
        case 4:
            thankProgressbar.progress = 0.4
            thankProgressbar.setProgress(0.4, animated: true)
        case 5:
            thankProgressbar.progress = 0.5
            thankProgressbar.setProgress(0.5, animated: true)
        case 6:
            thankProgressbar.progress = 0.6
            thankProgressbar.setProgress(0.6, animated: true)
        case 7:
            thankProgressbar.progress = 0.7
            thankProgressbar.setProgress(0.7, animated: true)
        case 8:
            thankProgressbar.progress = 0.8
            thankProgressbar.setProgress(0.8, animated: true)
        case 9:
            thankProgressbar.progress = 0.9
            thankProgressbar.setProgress(0.9, animated: true)
        default:
            thankProgressbar.progress = 1
            thankProgressbar.setProgress(1, animated: true)
        }
    }
    
    func progressCount3(data3: Int) {
        switch(data3) {
        case 0:
            moderationProgressbar.progress = 0
        case 1:
            moderationProgressbar.progress = 0.1
            moderationProgressbar.setProgress(0.1, animated: true)
        case 2:
            moderationProgressbar.progress = 0.2
            moderationProgressbar.setProgress(0.2, animated: true)
        case 3:
            moderationProgressbar.progress = 0.3
            moderationProgressbar.setProgress(0.3, animated: true)
        case 4:
            moderationProgressbar.progress = 0.4
            moderationProgressbar.setProgress(0.4, animated: true)
        case 5:
            moderationProgressbar.progress = 0.5
            moderationProgressbar.setProgress(0.5, animated: true)
        case 6:
            moderationProgressbar.progress = 0.6
            moderationProgressbar.setProgress(0.6, animated: true)
        case 7:
            moderationProgressbar.progress = 0.7
            moderationProgressbar.setProgress(0.7, animated: true)
        case 8:
            moderationProgressbar.progress = 0.8
            moderationProgressbar.setProgress(0.8, animated: true)
        case 9:
            moderationProgressbar.progress = 0.9
            moderationProgressbar.setProgress(0.9, animated: true)
        default:
            moderationProgressbar.progress = 1
            moderationProgressbar.setProgress(1, animated: true)
        }
    }
}
