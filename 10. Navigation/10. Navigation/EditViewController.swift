//
//  EditViewController.swift
//  10. Navigation
//
//  Created by 양나빈 on 12/13/25.
//

import UIKit

// 헤더 파일같이 객체가 갖춰야할 기능이나 속성에 대한 설계도임
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didSwitchOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didZoomInOutDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = "" // lblWay를 직접 수정할 수 없으므로 해당 변수 선언
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var switchOn: UISwitch!
    @IBOutlet var btnZoomInOutText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        switchOn.isOn = isOn
        btnZoomInOutText.setTitle(isZoom ? "축소" : "확대", for: UIControl.State.normal)
    }

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!) // 대리 함수 호출
            delegate?.didSwitchOnOffDone(self, isOn: isOn)
            delegate?.didZoomInOutDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true) // 화면 pop
    }
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnZoomInOut(_ sender: UIButton) {
        print(sender.titleLabel?.text == "확대")
        if sender.titleLabel?.text == "확대" {
            isZoom = true
            sender.setTitle("축소", for: UIControl.State.normal)
        } else {
            isZoom = false
            sender.setTitle("확대", for: UIControl.State.normal)
        }
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
