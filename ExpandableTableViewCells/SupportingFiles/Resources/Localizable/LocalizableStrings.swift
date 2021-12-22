//
//  LocalizableStrings.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import Foundation

enum LocalizableStrings {
    // MARK: - Item List
    case itemListScreenTitle
}


// MARK: - Helpers
extension LocalizableStrings {    
    func getValue() -> String {
        return NSLocalizedString("\(self)", comment: "")
    }
}
