//
//  ViewController.swift
//  DAY3: ImageView
//
//  Created by 양나빈 on 12/5/25.
//

import UIKit

class ViewController: UIViewController {
    var isZoom: Bool = false // 확대 여부 나타내는 변수
    var imgOn: UIImage? // 켜진 전구 이미지 담겨있는 변수
    var imgOff: UIImage? // 꺼진 전구 이미지 담겨있는 변수
    
    @IBOutlet var imgView: UIImageView! // 이미지뷰 아울렛 변수
    @IBOutlet var btnResize: UIButton! // 버튼 아울렛 변수
    
    // 뷰가 불러진 후 실행하는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png") // 켜진 전구 이미지 할당
        imgOff = UIImage(named: "lamp_off.png") // 꺼진 전구 이미지 할당
        
        imgView.image = imgOn // 켜진 전구 이미지를 imgView에 할당
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0 // 확대 배율 상수
        var newWidth: CGFloat, newHeight: CGFloat // 변경 후 크기 계산값 담겨있는 변수
        
        if isZoom {
            // 축소
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            // 확대
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

