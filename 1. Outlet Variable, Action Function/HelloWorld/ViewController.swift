//
//  ViewController.swift
//  HelloWorld
//
//  Created by 양나빈 on 12/4/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel! // 출력용 아울렛 변수
    @IBOutlet var txtName: UITextField! // 입력용 아울렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
}

