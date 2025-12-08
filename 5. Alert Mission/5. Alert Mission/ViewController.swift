//
//  ViewController.swift
//  5. Alert Mission
//
//  Created by 양나빈 on 12/8/25.
//

import UIKit

class ViewController: UIViewController {
    var alarmTime: String?
    var isAlreadyAlarm: Bool = false
    let interval = 1.0
    let timeSelector: Selector = #selector(changeNowTime)
    
    @IBOutlet var lblNowTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    // DatePicker가 Date를 선택했을 때 alarmTime 바꾸는 함수
    @IBAction func pickDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm a"
        alarmTime = formatter.string(from: sender.date)
        
        formatter.dateFormat = "yyyy:hh:mm a"
        lblSelectTime.text = formatter.string(from: sender.date)
    }
    
    // 1초마다 실행되는 함수
    // @objc : objective-C 런타임 함수
    @objc func changeNowTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm a"
        let nowTime = formatter.string(from: date as Date)
        
        // 알람 시간이면 알람창 켜기
        if nowTime == alarmTime {
            if !isAlreadyAlarm {
                // 알림창 띄우기
                let alarmAlert = UIAlertController(title: "알람", message: "알람 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "넹~", style: UIAlertAction.Style.default)
                alarmAlert.addAction(okAction)
                present(alarmAlert, animated: false, completion: nil)
                isAlreadyAlarm = true
            }
        } else {
            isAlreadyAlarm = false
        }
        
        formatter.dateFormat = "yyyy:hh:mm:ss a"
        lblNowTime.text = formatter.string(from: date as Date)
    }
    
    // isAlreadyAlarm를 false로 바꾸는 함수
    @objc func changeIsAleardyAlarmToFalse() {
        isAlreadyAlarm = false
    }
}

