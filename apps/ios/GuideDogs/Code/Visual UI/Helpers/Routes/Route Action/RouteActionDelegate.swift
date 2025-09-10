//
//  RouteActionDelegate.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

protocol RouteActionDelegate: AnyObject {
    func didSelectRouteAction(_ action: RouteAction, detail: RouteDetail)
}
