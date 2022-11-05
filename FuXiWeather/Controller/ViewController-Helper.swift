//
//  ViewController-Helper.swift
//  FuXiWeather
//
//  Created by 刘军 on 2021/6/6.
//

import Foundation
import SwiftyJSON

extension ViewController{
    func showWeather(_ weatherJSON: JSON){
        //数据
        weather.temp = "\(weatherJSON["now", "temp"].stringValue)˚"
        weather.icon = weatherJSON["now", "icon"].stringValue
        //UI
        tempLabel.text = weather.temp//self.tempLabel.text = Optional("aa")
        iconImageView.image = UIImage(named: weather.icon)
    }
    
    func showCity(_ cityJSON: JSON){
        //数据
        weather.city = cityJSON["location", 0 ,"name"].stringValue
        //UI
        cityLabel.text = weather.city
    }
    
    func getParameters(_ location: String) -> [String: String]{
        ["location": location, "key": kQWeatherWebKey]
    }
}
