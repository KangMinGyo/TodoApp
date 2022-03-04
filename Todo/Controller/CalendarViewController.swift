//
//  CalendarViewController.swift
//  Todo
//
//  Created by Kang on 2022/03/03.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var todayTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
    
        // Do any additional setup after loading the view.
        todayView.layer.cornerRadius = 15.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
    }
    
    //캘린더 눌렀을 때
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        setEvents()
    }
    
    func setEvents() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }

    
    
    //화면 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.todayTextField.resignFirstResponder()
    }
    
    //return키 눌렀을 떄 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.todayTextField.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
