//
//  ViewController.swift
//  4. PickerView
//
//  Created by 양나빈 on 12/7/25.
//

import UIKit

// 여기서 delegate(대리자)는 해당 객체가 터치되었을 때 호출되는 함수.
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let NUM_OF_IMAGES = 10 // 이미지 갯수
    let PICKER_VIEW_COLUMN = 1 // 피커뷰 열 갯수
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName: [String] = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                          "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // imageArray에 실제 이미지 할당
        for i in 0 ..< NUM_OF_IMAGES {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // 1.png로 초기화
        lblImageFileName.text = imageFileName[0]
        imgView.image = imageArray[0]
    }

    // 피커뷰에게 표시할 열(컴포넌트) 갯수 지정하는 함수
    // 처음 구현하는 것이므로 override 필요 없음
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 피커뷰에게 표시할 행 갯수 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
//    // 피커뷰에게 행의 제목을 지정하는 함수
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // 피커뷰에게 행의 뷰를 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    // 피커뷰에게 행의 높이를 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 피커뷰에서 행이 선택되었을 때 실행하는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }
}

