//
//  UIView+ReusableView.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReusableView { }
