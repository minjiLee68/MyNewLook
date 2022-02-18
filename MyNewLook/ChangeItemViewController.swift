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
    
    @IBOutlet weak var enter: UIButton!

    let viewmodel = RealmResultViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        textfieldCustom()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = contents1.text else { return false }
        if text.count >= 5 && range.length == 0 {
            return false
        }
        return true
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
}

extension ChangeItemViewController {
    @IBAction func enter(_ sender: UIButton) {
        viewmodel.titleDB(own: contents1.text! , two: contents2.text!, three: contents3.text!)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
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
