//
//  DataPickerViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import FSCalendar

class DataPickerViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    @IBOutlet weak var calendarOrigin: FSCalendar!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var viewUI: UIView!
    
        
    var contentViewController: ContentViewController!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contentView" {
            let containerVC = segue.destination as! ContentViewController
            contentViewController = containerVC
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        calendarStyle()
        viewDesign()
    }
}

extension DataPickerViewController {
    func calendarStyle() {
        calendarOrigin.locale = Locale(identifier: "en-US")
        
        calendarOrigin.headerHeight = 66
        calendarOrigin.weekdayHeight = 55
        calendarOrigin.appearance.headerMinimumDissolvedAlpha = 0.2
        calendarOrigin.appearance.headerTitleColor = .secondary
        calendarOrigin.appearance.headerDateFormat = "YYYY.MM"
        calendarOrigin.appearance.caseOptions = .weekdayUsesSingleUpperCase
        calendarOrigin.appearance.borderRadius = 0
        calendarOrigin.placeholderType = .none
        calendarOrigin.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        
        calendarOrigin.backgroundColor = .primary
        calendarOrigin.appearance.weekdayTextColor = .weekday
        calendarOrigin.appearance.selectionColor = .weekday
        calendarOrigin.appearance.titleWeekendColor = .secondary
        calendarOrigin.appearance.titleDefaultColor = .secondary
        
        calendarOrigin.appearance.titleTodayColor = .primary
        calendarOrigin.appearance.todayColor = .none
        calendarOrigin.appearance.weekdayFont = UIFont(name: "Apple Color Emoji", size: 20.0)
    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 15
        viewUI.clipsToBounds = true
        viewUI.layer.shadowRadius = 15
        viewUI.layer.shadowOpacity = 0.2
        viewUI.layer.shadowColor = UIColor.black.cgColor
        viewUI.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
}

extension UIColor {
    class var primary: UIColor? { return UIColor(named: "primary") }
    class var secondary: UIColor? { return UIColor(named: "secondary") }
    class var weekday: UIColor? { return UIColor(named: "weekday") }
}
