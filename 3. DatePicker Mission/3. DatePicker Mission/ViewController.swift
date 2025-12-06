//
//  ViewController.swift
//  3. DatePicker Mission
//
//  Created by 양나빈 on 12/6/25.
//

import UIKit

class ViewController: UIViewController {
    let interval = 1.0
    let timeSelector: Selector = #selector(ViewController.updateNow)
    var selectedTime: String?
    
    @IBOutlet var lblNow: UILabel!
    @IBOutlet var lblSelect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        lblSelect.text = formatter.string(from: sender.date)
        
        formatter.dateFormat = "HH:mm a"
        selectedTime = formatter.string(from: sender.date)
    }
    
    @objc func updateNow() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        lblNow.text = formatter.string(from: date as Date)
        
        // 현재 시각과 선택 시각이 같으면 빨간 배경
        formatter.dateFormat = "HH:mm a"
        let now = formatter.string(from: date as Date)
        if now == selectedTime {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

