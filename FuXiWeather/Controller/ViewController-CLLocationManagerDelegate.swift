//
//  ViewController-CLLocationManagerDelegate.swift
//  FuXiWeather
//
//  Created by 刘军 on 2021/6/6.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate{
    //当请求到用户位置成功时调用--系统调用，不需要我们自己调用
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        //print(lon,lat)
        
        AF.request(kQWeatherNowPath, parameters: getParameters("\(lon),\(lat)")).responseJSON { response in
            if let data = response.value{
                let weatherJSON = JSON(data)
                
                self.showWeather(weatherJSON)
            }
        }
        
        AF.request(kQWeatherCityPath, parameters: getParameters("\(lon),\(lat)")).responseJSON { response in
            if let data = response.value{
                let cityJSON = JSON(data)
                
                self.showCity(cityJSON)
            }
        }
        
    }
    
    
    //当请求到用户位置失败时调用--系统调用，不需要我们自己调用
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "获取位置失败"
    }
    
}
