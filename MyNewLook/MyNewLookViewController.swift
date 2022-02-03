//
//  MyNewLookViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit

class MyNewLookViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var 사랑: UILabel!
    @IBOutlet weak var 감사: UILabel!
    @IBOutlet weak var 절제: UILabel!
    
    @IBOutlet weak var progressLove: UIProgressView!
    @IBOutlet weak var progressThank: UIProgressView!
    @IBOutlet weak var progressModeration: UIProgressView!
    
    
    @IBOutlet weak var lovePlus: UIButton!
    @IBOutlet weak var thankPlus: UIButton!
    @IBOutlet weak var moderationPlus: UIButton!
    
    @IBOutlet weak var loveCount: UILabel!
    @IBOutlet weak var thankCount: UILabel!
    @IBOutlet weak var moderationCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
