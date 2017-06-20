//
//  Utility.swift
//  SQLite_FMDB_Exercise
//
//  Created by Wismin Effendi on 6/20/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import Foundation

struct Utility {
    
    static func getPath(_ fileName: String) -> String {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentURL.appendingPathComponent(fileName)
        return fileURL.path
    }
}
