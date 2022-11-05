//
//  ViewController.swift
//  FuXiWeather
//
//  Created by 刘军 on 2021/5/25.
//

import UIKit
import CoreLocation

//delegate--代理/委托
//protocol--协议

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    
    //当页面加载的时候调用--系统调用，不需要我们自己调用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()//请求授权获取当前位置
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers//设定位置精度
        locationManager.requestLocation()//请求用户位置
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "QueryViewControllerSegue"{
//            let vc = segue.destination as! QueryViewController
//            vc.currentCity = weather.city
//        }
        
        if let vc = segue.destination as? QueryViewController{
            vc.currentCity = weather.city
            vc.delegate = self
        }
    }

}

