//
//  ItemListView.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import Foundation
import UIKit

final class ItemListView: UIView {
    // MARK: - Properties
    
    
    // MARK: - Subviews
    
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - ViewCodable
extension ItemListView: ViewCodable {
    func buildViewHierarchy() {
        
    }
    
    func addConstraints() {
        
    }
}
