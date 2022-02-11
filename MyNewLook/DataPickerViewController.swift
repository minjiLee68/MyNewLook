//
//  DataPickerViewController.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/04.
//

import UIKit
import FSCalendar
import RealmSwift

class DataPickerViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    @IBOutlet weak var calendarOrigin: FSCalendar!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var viewUI: UIView!
    @IBOutlet weak var changeItem: UIButton!

    let realm = try! Realm()
        
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
        
        changeItem.addTarget(self, action:  #selector(goAlert), for: .touchUpInside)
    }
    
    @objc func goAlert() {
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "changeItem") as! ChangeItemViewController
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: false, completion: nil)
    }
}

extension DataPickerViewController {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let picDay = dateFormatter.string(from: date)
        
        let contents = realm.objects(ContentsData.self)
        let predicateQuery = contents.filter("date = %@", picDay)
        
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
