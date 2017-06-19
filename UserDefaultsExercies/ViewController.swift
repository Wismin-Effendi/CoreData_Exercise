//
//  ViewController.swift
//  UserDefaultsExercies
//
//  Created by Wismin Effendi on 6/19/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var quoteTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        nameField.text = userDefaults.string(forKey: "Name")
        genderField.text = userDefaults.string(forKey: "Gender")
        ageField.text = userDefaults.string(forKey: "Age")
        locationField.text = userDefaults.string(forKey: "Location")
        quoteTextView.text = userDefaults.string(forKey: "Quote")
        
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(nameField.text, forKey: "Name")
        userDefaults.set(genderField.text, forKey: "Gender")
        userDefaults.set(ageField.text, forKey: "Age")
        userDefaults.set(locationField.text, forKey: "Location")
        userDefaults.set(quoteTextView.text, forKey: "Quote")
    }


}

