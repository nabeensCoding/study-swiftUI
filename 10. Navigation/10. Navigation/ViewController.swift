//
//  ViewController.swift
//  10. Navigation
//
//  Created by 양나빈 on 12/13/25.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let scale = 2.0
    var isOn = true
    var isZoom = false

    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgOn
    }

    // 해당 세그가 해당 뷰 컨트롤러로 전환되기 직전에 실행되는 함수. 데이터 전달이 목적.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            // 버튼 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            // 바 버튼 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        editViewController.textMessage = txtMessage.text! // 텍스트필드 동기화 (메인화면-수정화면)
        editViewController.isOn = isOn // 스위치 동기화 (메인화면-수정화면)
        editViewController.isZoom = isZoom
        editViewController.delegate = self // 대리자를 본인으로 지정
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message // 수정화면에서 수정한 메시지를 메인 화면 텍스트필드에 넣음. (수정화면-메인화면 동기화)
    }
    
    func didSwitchOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didZoomInOutDone(_ controller: EditViewController, isZoom: Bool) {
        var newWidth, newHeight: Double
        
        if isZoom {
            // 확대
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
        } else {
            // 축소
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        self.isZoom = !self.isZoom
    }
}

