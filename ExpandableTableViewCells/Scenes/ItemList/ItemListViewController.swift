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
    
    private let items: [String] = (1...100).map({ return "Item \($0)" })
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarTitle(LocalizableStrings.itemListScreenTitle.getValue())
        
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
    }
}


// MARK: - UITableViewDataSource
extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected:", items[indexPath.row])
    }
}
