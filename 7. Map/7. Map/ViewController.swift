//
//  ViewController.swift
//  7. Map
//
//  Created by 양나빈 on 12/10/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let MAP_ZOOM = 0.01 // 지도 확대 비율
    
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 정보 초기화
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 위치 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 권한 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        myMap.showsUserLocation = true
    }

    // 지도 중심 이동하는 함수
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        // 지도를 나타내가 위한 네 개의 함수 호출
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위치 상수
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 범위 상수
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue) // 리젼 상수
        myMap.setRegion(pRegion, animated: true) // 리젼 정의하는 함수 호출
        
        return pLocation // 위치 반환
    }
    
    // 핀 설치하는 함수
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle:String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 현재 위치를 업데이트하면 실행하는 델리게이트 함수
    // 주소지 불러옴
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 지도 중심 이동하기
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: MAP_ZOOM)
        
        // 위치 정보 나타내기
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil { // 지역값
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil { // 도로값
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재위치"
            self.lblLocationInfo2.text = address
        })
        
        // 위치 업데이트 종료
        locationManager.stopUpdatingLocation()
    }

    // 세그먼트 클릭하면 실행하는 함수
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재위치
            self.locationManager.startUpdatingLocation()
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
        } else if sender.selectedSegmentIndex == 1 {
            // 포스텍
            setAnnotation(latitudeValue: 36.013385, longitudeValue: 129.326235, delta: MAP_ZOOM, title: "포스텍", subtitle: "3개월뒤 내가 있을 곳")
            self.lblLocationInfo1.text = "포스텍"
            self.lblLocationInfo2.text = "3개월뒤 내가 있을 곳"
        } else if sender.selectedSegmentIndex == 2 {
            // 토스
            setAnnotation(latitudeValue: 37.499994, longitudeValue: 127.032902, delta: MAP_ZOOM, title: "토스", subtitle: "1년뒤 내가 있을 곳")
            self.lblLocationInfo1.text = "토스"
            self.lblLocationInfo2.text = "1년뒤 내가 있을 곳"
        }
    }
}

