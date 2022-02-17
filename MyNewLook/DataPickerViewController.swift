//
//  DataPickerViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import FSCalendar
import RealmSwift
import SwiftUI

class DataPickerViewController: UIViewController {
    @IBOutlet weak var calendarOrigin: FSCalendar!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var viewUI: UIView!
    @IBOutlet weak var changeItem: UIButton!
    
    var text1: String = ""
    var text2: String = ""
    var text3: String = ""
    
    var dateFormatter = DateFormatter()
    var todayDate = Date()
    
    var contentViewController: ContentViewController!
    let viewmodel = RealmResultViewModel.shared

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contentView" {
            let containerVC = segue.destination as! ContentViewController
            contentViewController = containerVC
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calendarOrigin.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        calendarStyle()
        viewDesign()
        calendarStyle()
        titleLable()
        
        changeItem.addTarget(self, action:  #selector(goAlert), for: .touchUpInside)
    }
    
    @objc func goAlert() {
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "changeItem") as! ChangeItemViewController
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: false, completion: nil)
    }
    
    func titleLable() {
        text1 = viewmodel.title1
        text2 = viewmodel.title2
        text3 = viewmodel.title3
    }
}

extension DataPickerViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        todayDate = Date()
        let today = dateFormatter.string(from: todayDate)
        let day = dateFormatter.string(from: date)
        
        if today == day {
            return "TODAY"
        }
        return day
    }
}

extension DataPickerViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        dateFormatter.dateFormat = "YYYYMMdd"
        let picDate = dateFormatter.string(from: date)        
        viewmodel.fetchObject(date: picDate, title1: text1, title2: text2, title3: text3)
    
        if viewmodel.data1?.date == picDate {
            let check1 = viewmodel.data1?.check ?? "false"
            contentViewController.check1.isSelected = Bool(check1)!
        } else {
            contentViewController.check1.isSelected = false
        }
        
        if viewmodel.data2?.date == picDate {
            let check2 = viewmodel.data2?.check ?? "false"
            contentViewController.check2.isSelected = Bool(check2)!
        } else {
            contentViewController.check2.isSelected = false
        }
        
        if viewmodel.data3?.date == picDate {
            let check3 = viewmodel.data3?.check ?? "false"
            contentViewController.check3.isSelected = Bool(check3)!
        } else {
            contentViewController.check3.isSelected = false
        }
    }
}

//extension DataPickerViewController: FSCalendarDelegateAppearance {
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
//        
//        dateFormatter.dateFormat = "YYYYMMdd"
//        let thisDate = dateFormatter.string(from: date)
//        guard let thisDay = viewmodel.fileterObject(what: thisDate) else { return UIColor.clear }
//    }
//}

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
        calendarOrigin.appearance.borderDefaultColor = .lightGray
        
        calendarOrigin.appearance.titleTodayColor = .secondary
        calendarOrigin.appearance.todayColor = .none
        calendarOrigin.appearance.weekdayFont = UIFont(name: "Apple Color Emoji", size: 18.0)
    }
    
    func viewDesign() {
        viewUI.layer.cornerRadius = 15
        viewUI.clipsToBounds = true
    }
}

extension UIColor {
    class var primary: UIColor? { return UIColor(named: "primary") }
    class var secondary: UIColor? { return UIColor(named: "secondary") }
    class var containColor: UIColor? { return UIColor(named: "containerColor") }
}
