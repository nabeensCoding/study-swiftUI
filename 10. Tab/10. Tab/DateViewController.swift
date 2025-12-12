//
//  ViewController.swift
//  3. DatePicker
//
//  Created by 양나빈 on 12/6/25.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector :Selector = #selector(DateViewController.updateTime) // 타이머가 시작되면 실행할 함수
    let interval = 1.0 // 타이머 간격 (1초)
    
    @IBOutlet var lblNowTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDate(_ sender: UIDatePicker) {
        // datePickerView로 이름 바꾸기
        let datePickerView = sender
        
        // 날짜 포메터 정의
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        // 선택 시간 변경
        lblSelectTime.text = "select time: " + formatter.string(from: datePickerView.date)
    }
    
    // 타이머 구동될 때 실행하는 함수
    @objc func updateTime() { // @objc는 objective-c와 호환을 위한 키워드임.
        let date = NSDate() // 현재시간 상수
        
        // 날짜 포메터 정의
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        
        lblNowTime.text = "now time: " + formatter.string(from: date as Date)
    }
}

