//
//  PersistentNotificationObserver.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol PersistentNotificationObserver: NotificationObserver { }

extension PersistentNotificationObserver {
    
    var didDismiss: Bool {
        return false
    }
    
}
