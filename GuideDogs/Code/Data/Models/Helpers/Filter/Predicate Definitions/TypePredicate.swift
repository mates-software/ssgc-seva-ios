//
//  TypePredicate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

struct TypePredicate: FilterPredicate {
    
    let expectedType: Type
    
    init(expected: Type) {
        self.expectedType = expected
    }
    
    func isIncluded(_ a: POI) -> Bool {
        return expectedType.matches(poi: a)
    }
    
}
