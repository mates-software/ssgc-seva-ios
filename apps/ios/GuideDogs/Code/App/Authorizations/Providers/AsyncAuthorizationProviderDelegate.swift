//
//  AsyncAuthorizationProviderDelegate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol AsyncAuthorizationProviderDelegate: AnyObject {
    func authorizationDidChange(_ authorization: AuthorizationStatus)
}
