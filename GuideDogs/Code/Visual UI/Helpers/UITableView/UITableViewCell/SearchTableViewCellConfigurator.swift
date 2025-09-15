//
//  SearchTableViewCellConfigurator.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

class SearchTableViewCellConfigurator: TableViewCellConfigurator {
    
    typealias TableViewCell = SearchTableViewCell
    typealias Model = String
    
    // MARK: `TableViewCellConfigurator`
    
    var accessibilityHint: String?
    
    func configure(_ cell: TableViewCell, forDisplaying model: Model) {
        // Align background with POI rows styling
        cell.backgroundColor = Colors.Background.menuAlternate
        cell.contentView.backgroundColor = Colors.Background.menuAlternate
        cell.textLabel?.text = GDLocalizedString("search.search_for", model)
    }
    
}
