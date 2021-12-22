//
//  ItemListViewController.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import UIKit

final class ItemListViewController: UIViewController {
    // MARK: - Properties
    private lazy var baseView = ItemListView()
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarTitle(LocalizableStrings.itemListScreenTitle.getValue())
    }
}

