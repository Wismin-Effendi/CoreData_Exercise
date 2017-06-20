//
//  ModelManager.swift
//  SQLite_FMDB_Exercise
//
//  Created by Wismin Effendi on 6/20/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import UIKit

class ModelManager: NSObject {

    var database: FMDatabase?
    
    private static let sharedInstance = ModelManager()
    
    static func getInstance() -> ModelManager {
        
        if sharedInstance.database == nil {
            sharedInstance.database = FMDatabase(path: Utility.getPath("Person.sqlite"))
        }
        return sharedInstance
    }
}
