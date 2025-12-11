//
//  ViewController.swift
//  8. PageControl Mission
//
//  Created by 양나빈 on 12/11/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 초기화
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        lblNumber.text = "1"
    }


    @IBAction func changePage(_ sender: UIPageControl) {
        lblNumber.text = String(sender.currentPage + 1)
    }
}

