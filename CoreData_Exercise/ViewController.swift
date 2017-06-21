//
//  ViewController.swift
//  CoreData_Exercise
//
//  Created by Wismin Effendi on 6/19/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var locationField: UITextField!

    // MARK: - Properties 
    var managedContext: NSManagedObjectContext!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveToCoreData()
        
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        do {
            let results = try managedContext.fetch(request)
            person = results.first
            nameField.text = person.name
            genderField.text = person.gender
            if person.age != 0 {
                ageField.text = String(person.age)
            } else {
                ageField.text = ""
            }
            locationField.text = person.location
            
        } catch let error as NSError {
            print("Fetching Error: \(error.userInfo)")
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        saveToCoreData()
    }
    
    private func saveToCoreData() {
        if person == nil {
            let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
            person = Person(entity: entity, insertInto: managedContext)
        }
        
        person.name = nameField.text
        person.gender = genderField.text
        if let ageText = ageField.text, let age = Int16(ageText) {
            person.age = age
        }
        person.location = locationField.text
        try!  managedContext.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowViewController",
            let showVC = segue.destination as? ShowViewController {
            
            showVC.managedContext = managedContext
        }
        
    }

}

