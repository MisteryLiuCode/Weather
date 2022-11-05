//
//  QueryViewController.swift
//  FuXiWeather
//
//  Created by 刘军 on 2021/6/1.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    
    var currentCity = ""
    var delegate: QueryViewControllerDelegate?

    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var cityTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        cityTextfield.becomeFirstResponder() //cityTextfield.resignFirstResponder()
        
        currentCityLabel.text = currentCity
    }
    
    @IBAction func back(_ sender: Any) { dismiss(animated: true) }
    
    @IBAction func query(_ sender: Any) {
        dismiss(animated: true)
        
        if !cityTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegate?.didChangeCity(city: cityTextfield.text!)
        }

    }
    
    

}
