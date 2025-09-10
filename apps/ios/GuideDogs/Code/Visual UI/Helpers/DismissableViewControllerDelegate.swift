//
//  DismissableViewControllerDelegate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol DismissableViewControllerDelegate: AnyObject {
    func onDismissed(_ viewController: UIViewController)
}
