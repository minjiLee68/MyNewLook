//
//  DataPickerViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import FloatingPanel

class DataPickerViewController: UIViewController, FloatingPanelControllerDelegate {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fcp = FloatingPanelController()
        fcp.delegate = self
        
        guard let contentViewcontroller = storyboard?.instantiateViewController(withIdentifier: "content") as? ContentViewController else { return }
        fcp.set(contentViewController: contentViewcontroller)
        fcp.addPanel(toParent: self)
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(handleDatePicler(_:)), for: .valueChanged)
    }
    @objc
    private func handleDatePicler(_ sender: UIDatePicker) {
        print(sender.date)
    }
}
