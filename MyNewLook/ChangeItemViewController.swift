//
//  ChangeItemViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/10.
//

import UIKit
import Foundation
import RealmSwift

class ChangeItemViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var contents1: UITextField!
    @IBOutlet weak var contents2: UITextField!
    @IBOutlet weak var contents3: UITextField!
    @IBOutlet weak var viewUI: UIView!
    
    @IBOutlet weak var enter: UIButton!
    
    let viewmodel = RealmResultViewModel.shared
    let contentVC = ContentViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDesign()
    }
    
    override func viewDidLayoutSubviews() {
        textfieldCustom()
    }
    
    @IBAction func tapBG(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 28
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = contents1.text else { return false }
        if text.count >= 5 && range.length == 0 {
            return false
        }
        return true
    }
}

extension ChangeItemViewController {
    @IBAction func enter(_ sender: UIButton) {
        viewmodel.titleDB(own: contents1.text ?? "_", two: contents2.text ?? "_", three: contents3.text ?? "_")
        self.dismiss(animated: false, completion: nil)
    }
}

extension ChangeItemViewController {
    func textfieldCustom() {
        contents1.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: contents1.frame.size.height-1, width: contents1.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        contents1.layer.addSublayer(border)
        contents1.textAlignment = .left
        
        contents2.borderStyle = .none
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: contents1.frame.size.height-1, width: contents1.frame.width, height: 1)
        border2.backgroundColor = UIColor.lightGray.cgColor
        contents2.layer.addSublayer(border2)
        contents2.textAlignment = .left
        
        contents3.borderStyle = .none
        let border3 = CALayer()
        border3.frame = CGRect(x: 0, y: contents1.frame.size.height-1, width: contents1.frame.width, height: 1)
        border3.backgroundColor = UIColor.lightGray.cgColor
        contents3.layer.addSublayer(border3)
        contents3.textAlignment = .left
    }
}
extension Notification.Name {
    static let titleObserver = Notification.Name("titleObserver")
}
