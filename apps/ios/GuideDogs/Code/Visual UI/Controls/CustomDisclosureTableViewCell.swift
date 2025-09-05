//
//  CustomDisclosureTableViewCell.swift
//  Soundscape
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import UIKit

class CustomDisclosureTableViewCell: UITableViewCell {
    
    private static let disclosureImage = UIImage(named: "chevron_right-white-18dp")!
    
    private var disclosureImage: TintedImageView {
        let chevronImageView = TintedImageView(image: CustomDisclosureTableViewCell.disclosureImage)
        chevronImageView.normalTintColor = Colors.fontColor
        chevronImageView.highlightedTintColor = Colors.fontColor
        return chevronImageView
    }
    
    private var activityIndicator: UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = Colors.fontColor
        spinner.startAnimating()
        return spinner
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        self.accessoryView = disclosureImage
        self.selectionStyle = .default
        self.backgroundColor = Colors.Foreground.primary
    }
    
    func showActivityIndicator() {
        accessoryView = activityIndicator
    }
    
    func hideActivityIndicator() {
        accessoryView = disclosureImage
    }
}
