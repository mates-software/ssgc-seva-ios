//
//  Result+Extensions.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

extension Result where Success == Void {
    static var success: Result {
        return .success(())
    }
}
