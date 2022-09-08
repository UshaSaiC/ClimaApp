//
//  ViewController.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 06/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }


    @IBAction func seachButtonTapped(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    // didUpdateWeather is completely dependent n completion handler execution
    // Completion handler tends to handle long running tasks like networking and these long runnning tasks are generally executed in background. In here, we are trying to update UI and networking is being done. Lets say for instance, we say wait until networking is done.. then our UI will be static in that time which is not good. So, in here if we want to wait till execution then we have to tell the same to main thread and tell after execution is done update UI
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            // as Dispatchqueue is a closure, we have to add self label
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImage.image = UIImage(systemName: weather.conditionName)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

