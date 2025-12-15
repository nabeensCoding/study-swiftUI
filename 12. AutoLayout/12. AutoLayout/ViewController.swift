//
//  ViewController.swift
//  12. AutoLayout
//
//  Created by 양나빈 on 12/15/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    viewController.title = "김양갱"
    let navController = UINavigationController(rootViewController: viewController)
    return navController
}
