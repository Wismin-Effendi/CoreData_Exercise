//
//  ShowViewController.swift
//  CoreData_Exercise
//
//  Created by Wismin Effendi on 6/20/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit
import CoreData

class ShowViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Properties...
    var managedContext: NSManagedObjectContext!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Show Result"
        
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        do {
            let results = try managedContext.fetch(request)
            person = results.first
            
            nameLabel.text = person.name
            genderLabel.text = person.gender
            if person.age != 0 {
                ageLabel.text = String(person.age)
            } else {
                ageLabel.text = ""
            }
            locationLabel.text = person.location
            
        } catch let error as NSError {
            print("Fetching Error: \(error.userInfo)")
        }
    }
}
