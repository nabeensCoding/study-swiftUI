//
//  ViewController.swift
//  6. WebView
//
//  Created by 양나빈 on 12/9/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    let INIT_URL = "https://www.naver.com"
    let SITE1_URL = "https://www.youtube.com"
    let SITE2_URL = "https://github.com/nabeensCoding"
    
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var activeIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) // URL 선언
        let myRequest = URLRequest(url: myUrl!) // 요청 선언
        myWebView.load(myRequest) // 요청 로드
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage(INIT_URL)
    }
    
    // 웹뷰 로딩이 시작되었을 때 실행하는 델리게이트 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activeIndicator.startAnimating()
        activeIndicator.isHidden = false
    }
    
    // 웹뷰 로딩이 완료되었을 때 실행하는 델리게이트 함수
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activeIndicator.stopAnimating()
        activeIndicator.isHidden = true
    }
    
    // 웹뷰 로딩이 실패하였을 때 실행하는 델리게이트 함수
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        activeIndicator.stopAnimating()
        activeIndicator.isHidden = true
    }
    
    // http 없으면 추가하는 함수
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    // URL 입력하고 Go 버튼 누르면 실행하는 함수
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    // Site1로 이동하는 함수
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage(SITE1_URL)
    }
    
    // Site2로 이동하는 함수
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage(SITE2_URL)
    }
    
    // raw html로 이동하는 함수
    @IBAction func btnHTML(_ sender: UIButton) {
        let html = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(html, baseURL: nil)
    }
    
    // html file로 이동하는 함수
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnFastFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

