//
//  ItemListViewController.swift
//  ExpandableTableViewCells
//
//  Created by Isnard Silva on 22/12/21.
//

import UIKit

class Section {
    // MARK: - Properties
    let title: String
    let options: [String]
    var isOpened: Bool
    
    
    // MARK: - Initialization
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}



final class ItemListViewController: UIViewController {
    // MARK: - Properties
    private lazy var baseView = ItemListView()
        
    
    private var sections = [Section]()
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
        
        getAllSections()
    }
}


// MARK: - Handle Sections
extension ItemListViewController {
    private func getAllSections() {
        sections = [
            Section(title: "Section 1", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 2", options: [1].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 3", options: [1, 2].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 4", options: [1, 2, 3, 4, 5].compactMap({ return "Cell \($0)" }))
        ]
    }
}



// MARK: - UITableViewDataSource
extension ItemListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = sections[section]
        
        if currentSection.isOpened {
            return currentSection.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .systemBlue
        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
            cell.backgroundColor = .white
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened.toggle()
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            print("Tapped sub cell")
        }
    }
}
