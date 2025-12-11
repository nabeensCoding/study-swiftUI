//
//  ViewController.swift
//  8. PageControl
//
//  Created by 양나빈 on 12/11/25.
//

import UIKit

let images = [ "01.png", "02.png", "03.png", "04.png", "05.png", "06.png" ]

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 화면 초기화
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imageView.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
}

