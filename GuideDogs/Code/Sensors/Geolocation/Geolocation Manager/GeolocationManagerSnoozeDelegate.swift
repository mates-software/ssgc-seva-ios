//
//  GeolocationManagerSnoozeDelegate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol GeolocationManagerSnoozeDelegate: AnyObject {
    func snoozeDidFail()
    func snoozeDidTrigger()
}
