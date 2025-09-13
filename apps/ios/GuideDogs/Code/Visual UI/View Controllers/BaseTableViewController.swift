//
//  BaseTableViewController.swift
//  Seva
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import UIKit

class BaseTableViewController: UITableViewController {

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.defaultBackBarButtonItem

        self.tableView.backgroundColor = Colors.Background.primary
        self.tableView.separatorColor = Colors.Foreground.primary
    }

    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let view = view as? UITableViewHeaderFooterView else { return }

        view.textLabel?.textColor = Colors.fontColor
        view.backgroundView?.backgroundColor = Colors.fontColor
        
        if let text = view.textLabel?.text, text.lowercased().contains("callout") {
            view.accessibilityLabel = text.lowercased().replacingOccurrences(of: "callout", with: "call out")
        } else {
            view.accessibilityLabel = view.textLabel?.text
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        guard let view = view as? UITableViewHeaderFooterView else { return }
        
        view.textLabel?.textColor = Colors.fontColor
        view.backgroundView?.backgroundColor = Colors.Background.primary
        
        if let text = view.textLabel?.text, text.lowercased().contains("callout") {
            view.accessibilityLabel = text.lowercased().replacingOccurrences(of: "callout", with: "call out")
        } else {
            view.accessibilityLabel = view.textLabel?.text
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.textColor = Colors.fontColor
        cell.detailTextLabel?.textColor = Colors.Foreground.primary

        cell.imageView?.tintColor = Colors.fontColor
        // Reload the image for the tint to take effect
        cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)

        cell.backgroundColor = Colors.Foreground.primary
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
