//
//  ViewController.swift
//  ClimaApp
//
//  Created by Usha Sai Chintha on 06/09/22.
//

import UIKit

// UITextFieldDelegate allows view controller to manage editing and validation of text in a text field object
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // below line ensures that text field reports back to view controller
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
        searchTextField.text = ""
    }
    
    // based on text present in text field, it helps in deciding if we should close keypad ordo something
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textFieldd.text != ""{
            return true
        }else{
            textField.placeholder = "Type Something"
            return false
        }
    }
}

