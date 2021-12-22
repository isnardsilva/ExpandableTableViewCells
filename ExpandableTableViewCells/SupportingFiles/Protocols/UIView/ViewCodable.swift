//
//  ViewCodable.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import Foundation
import UIKit

protocol ViewCodable {
    func setupViews()
    func buildViewHierarchy()
    func addConstraints()
    func setupActions()
    func setupAditionalConfiguration()
}


// MARK: - Default Implementation
extension ViewCodable where Self: UIView {
    func setupViews() {
        if #available(iOS 13, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        
        buildViewHierarchy()
        addConstraints()
        setupActions()
        setupAditionalConfiguration()
    }
    
    func setupActions() { }
    func setupAditionalConfiguration() { }
}
