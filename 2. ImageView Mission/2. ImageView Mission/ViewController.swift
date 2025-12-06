//
//  ViewController.swift
//  2. ImageView Mission
//
//  Created by 양나빈 on 12/5/25.
//

import UIKit

class ViewController: UIViewController {
    var numImage: Int = 1 // 이미지 인덱스 변수
    let maxImage: Int = 6 // 이미지 최대 인덱스 상수
    
    @IBOutlet var imgView: UIImageView! // 이미지뷰 아울렛 변수
    
    // 뷰가 로드된 후 실행하는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지뷰를 1.png로 초기화
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }


    @IBAction func btnBackward(_ sender: UIButton) {
        numImage -= 1
        if numImage < 1 { // 만약 1보다 작으면 최대 인덱스로 변경
            numImage = maxImage
        }
        
        // 이미지뷰 변경
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
    @IBAction func btnForward(_ sender: UIButton) {
        numImage += 1
        if numImage > maxImage { // 만약 최대 인덱스보다 크면 1로 변경
            numImage = 1
        }
        
        // 이미지뷰 변경
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
}

