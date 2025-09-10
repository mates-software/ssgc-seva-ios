//
//  AuthorizationProvider.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol AuthorizationProvider {
    var authorizationStatus: AuthorizationStatus { get }
    func requestAuthorization()
}

extension AuthorizationProvider {
    
    var isAuthorized: Bool {
        return authorizationStatus == .authorized
    }
    
    var didRequestAuthorization: Bool {
        return authorizationStatus != .notDetermined
    }
    
}
