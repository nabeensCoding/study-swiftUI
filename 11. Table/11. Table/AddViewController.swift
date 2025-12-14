//
//  AddViewController.swift
//  11. Table
//
//  Created by 양나빈 on 12/14/25.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let NUM_OF_IMAGES = 10 // 이미지 갯수
    let PICKER_VIEW_COLUMN = 1 // 피커뷰 열 갯수
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]()
    var selectedIconName = ""
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< itemsImageFile.count {
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        
        iconView.image = imageArray[0]
    }
    
    // 추가하기 버튼
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(selectedIconName)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    // 피커뷰에게 표시할 열(컴포넌트) 갯수 지정하는 함수
    // 처음 구현하는 것이므로 override 필요 없음
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 피커뷰에게 표시할 행 갯수 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    // 피커뷰에게 행의 뷰를 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        
        return imageView
    }
    
    // 피커뷰에게 행의 높이를 지정하는 함수
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 피커뷰에서 행이 선택되었을 때 실행하는 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iconView.image = imageArray[row]
        selectedIconName = itemsImageFile[row]
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
