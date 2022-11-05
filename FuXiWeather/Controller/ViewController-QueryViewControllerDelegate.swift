//
//  ViewController-QueryViewControllerDelegate.swift
//  FuXiWeather
//
//  Created by 刘军 on 2021/6/6.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate{
    func didChangeCity(city: String) {
        //print(city)

        AF.request(kQWeatherCityPath, parameters: getParameters(city)).responseJSON { response in
            if let data = response.value{
                let cityJSON = JSON(data)
                self.showCity(cityJSON)
                
                let cityID = cityJSON["location", 0 , "id"].stringValue
                AF.request(kQWeatherNowPath, parameters: self.getParameters(cityID)).responseJSON { response in
                    if let data = response.value{
                        let weatherJSON = JSON(data)
                        self.showWeather(weatherJSON)
                    }
                }
            }
        }
    }
    
}
