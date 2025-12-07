//
//  ViewController.swift
//  4. PickerView Mission
//
//  Created by 양나빈 on 12/7/25.
//

import UIKit


// delegate와 pickerView를 반드시 연결해줘야함.
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let NUM_OF_IMAGES = 10
    let PICKER_VIEW_COLUMN = 2
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    let imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                          "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    var imageArray = [UIImage?]()
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageTitle: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // imageArray에 실제 이미지 할당
        for i in 0 ..< NUM_OF_IMAGES {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // 1.png로 초기화
        lblImageTitle.text = imageFileName[0]
        imageView.image = imageArray[0]
    }

    // 피커뷰 행 높이 지정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 피커뷰 행 갯수 지정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // 피커뷰 행 선택되었을 때 실행하는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            lblImageTitle.text = imageFileName[row]
        } else {
            imageView.image = imageArray[row]
        }
    }
    
    // 피커뷰 뷰 지정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    // 피커뷰 열(컴포넌트) 갯수 지정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
}

