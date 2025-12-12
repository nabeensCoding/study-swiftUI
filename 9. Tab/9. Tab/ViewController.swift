//
//  ViewController.swift
//  10. Tab
//
//  Created by 양나빈 on 12/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnGoToImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnGoToDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

