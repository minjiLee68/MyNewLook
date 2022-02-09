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
        calendarStyle()
    }
}

extension DataPickerViewController {
    func calendarStyle() {
        calendarOrigin.locale = Locale(identifier: "en-US")
        
        calendarOrigin.headerHeight = 66
        calendarOrigin.weekdayHeight = 55
        calendarOrigin.appearance.headerMinimumDissolvedAlpha = 0.15
        calendarOrigin.appearance.headerTitleColor = .secondary
        calendarOrigin.appearance.headerDateFormat = "YYYY.MM"
        calendarOrigin.appearance.caseOptions = .weekdayUsesSingleUpperCase
        calendarOrigin.appearance.borderRadius = 0
        calendarOrigin.placeholderType = .none
        
        calendarOrigin.appearance.weekdayTextColor = .secondary
        calendarOrigin.appearance.selectionColor = .containColor
        calendarOrigin.appearance.titleWeekendColor = .secondary
        calendarOrigin.appearance.titleDefaultColor = .secondary
        
        calendarOrigin.appearance.titleTodayColor = .secondary
        calendarOrigin.appearance.todayColor = .none
    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 15
        viewUI.clipsToBounds = true
    }
    
    func calendarFont() {
        calendarOrigin.appearance.headerTitleFont = UIFont(name: "System Bold", size: 28.0)
        calendarOrigin.appearance.weekdayFont = UIFont(name: "Apple Color Emoji", size: 18.0)
        calendarOrigin.appearance.subtitleFont = UIFont(name: "Apple Color Emoji", size: 14.0)
    }
}

extension UIColor {
    class var primary: UIColor? { return UIColor(named: "primary") }
    class var secondary: UIColor? { return UIColor(named: "secondary") }
    class var containColor: UIColor? { return UIColor(named: "containerColor") }
}
