//
//  RealmString.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import RealmSwift

class RealmString: Object {
    @objc dynamic var string: String = ""
    
    convenience init(string: String) {
        self.init()
        
        self.string = string
    }
}
