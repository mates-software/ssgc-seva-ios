//
//  GeolocationManagerUpdateDelegate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation
import CoreLocation

protocol GeolocationManagerUpdateDelegate: AnyObject {
    func didUpdateLocation(_ location: CLLocation)
}
