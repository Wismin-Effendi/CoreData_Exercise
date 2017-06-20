//
//  ShowViewController.swift
//  SQLite_FMDB_Exercise
//
//  Created by Wismin Effendi on 6/20/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Show Result"
        loadFromDB()
    }

    // Helper for FMDB SQLite persistence
    private func loadFromDB() {
        let modelManager = ModelManager.getInstance()
        if let fmdb = modelManager.database {
            fmdb.open()
            
            let selectSql = "select * from Person"
            let fmdbResult = fmdb.executeQuery(selectSql, withParameterDictionary: nil)
            if (fmdbResult?.next())! {
                // populate the filed
                nameLabel.text = fmdbResult?.string(forColumn: "Name") ?? ""
                genderLabel.text = fmdbResult?.string(forColumn: "Gender") ?? ""
                ageLabel.text = fmdbResult?.string(forColumn: "Age") ?? ""
                locationLabel.text = fmdbResult?.string(forColumn: "Location") ?? ""
            }
            
            fmdb.close()
        }
    }

  

}
