//
//  DataPickerViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import FloatingPanel
import FSCalendar

class DataPickerViewController: UIViewController, FloatingPanelControllerDelegate {
    @IBOutlet weak var calendarOrigin: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bottomSheet()
        calendarStyle()
    }
    
//    func bottomSheet() {
//        let fcp = FloatingPanelController()
//        let appearance = SurfaceAppearance()
//        appearance.cornerRadius = 30.0
//        appearance.backgroundColor = .clear
//        fcp.delegate = self
//        guard let contentViewcontroller = storyboard?.instantiateViewController(withIdentifier: "content") as? ContentViewController else { return }
//        fcp.set(contentViewController: contentViewcontroller)
//        fcp.addPanel(toParent: self)
//        fcp.surfaceView.appearance = appearance
//    }
}

extension DataPickerViewController {
    func calendarStyle() {
        calendarOrigin.locale = Locale(identifier: "ko_KR")
        
        calendarOrigin.headerHeight = 66
        calendarOrigin.weekdayHeight = 51
        calendarOrigin.appearance.headerMinimumDissolvedAlpha = 0.3
        calendarOrigin.appearance.headerTitleColor = .black
        calendarOrigin.appearance.headerDateFormat = "YYYY년 M월"
        calendarOrigin.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        
        calendarOrigin.backgroundColor = .white
        calendarOrigin.appearance.weekdayTextColor = .black
        calendarOrigin.appearance.selectionColor = .gray
        calendarOrigin.appearance.titleWeekendColor = .black
        calendarOrigin.appearance.titleDefaultColor = .black
        
        calendarOrigin.appearance.titleTodayColor = .systemBlue
        calendarOrigin.appearance.todayColor = .clear
        calendarOrigin.appearance.todaySelectionColor = .clear
        
        calendarOrigin.appearance.headerTitleFont = UIFont(name: "NotoSansCJKKR-Medium", size: 16)
        
        calendarOrigin.appearance.titleFont = UIFont(name: "Roboto-Regular", size: 14)
    }
}
