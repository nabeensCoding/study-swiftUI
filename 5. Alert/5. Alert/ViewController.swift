//
//  ViewController.swift
//  5. Alert
//
//  Created by 양나빈 on 12/8/25.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemoved = UIImage(named: "lamp-remove.png")
    var isOn = true
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 켜진 이미지로 초기화
        imageView.image = imgOn
    }


    @IBAction func btnTurnOn(_ sender: UIButton) {
        if isOn {
            let alreadyTunOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert) // 알림창 컨트롤러 정의
            let onAction = UIAlertAction(title: "넹~", style: UIAlertAction.Style.default, handler: nil) // 답변란 정의
            
            alreadyTunOnAlert.addAction(onAction) // 알림창에 답변란 추가
            present(alreadyTunOnAlert, animated: true, completion: nil) // present라는 실행 함수 실행
        } else {
            imageView.image = imgOn
            isOn = true
        }
    }
    
    @IBAction func btnTurnOff(_ sender: UIButton) {
        if isOn {
            let turnOffAlert = UIAlertController(title: "끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert) // 알림창 컨트롤러 정의
            let offAction = UIAlertAction(title: "넹~", style: UIAlertAction.Style.default, handler: { ACTION in self.imageView.image = self.imgOff
                self.isOn = false
            }) // "네" 답변란 정의
            let cancelAction = UIAlertAction(title: "아니용", style: UIAlertAction.Style.default) // "아니요" 답변란 정의
            
            turnOffAlert.addAction(offAction)
            turnOffAlert.addAction(cancelAction)
            present(turnOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let removeLampAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니용, 끕니다", style: UIAlertAction.Style.default, handler: { ACTION in self.imageView.image = self.imgOff
            self.isOn = false
        })
        let onAction = UIAlertAction(title: "아니용, 켭니다", style: UIAlertAction.Style.default, handler: { ACTION in self.imageView.image = self.imgOn
            self.isOn = true
        })
        let removeAction = UIAlertAction(title: "넹, 제거합니다", style: UIAlertAction.Style.default, handler: { ACTION in self.imageView.image = self.imgRemoved
            self.isOn = false
        })
        
        removeLampAlert.addAction(offAction)
        removeLampAlert.addAction(onAction)
        removeLampAlert.addAction(removeAction)
        present(removeLampAlert, animated: true, completion: nil)
    }
}

