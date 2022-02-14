//
//  CharacterListViewController.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import UIKit

class CharacterListViewController: UITableViewController {
    // MARK: Variables
    let viewModel: CharacterListViewModel
    lazy var searchBar: UISearchBar = UISearchBar()
    var isSearchActive: Bool = false
    var itemSelected: ((Character) -> Void)?

    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    private func setupTableView() {
        tableView.estimatedRowHeight = 450
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTableViewCell.self)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.refreshControl?.beginRefreshing()
    }

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
           searchBar.placeholder = " Search..."
           searchBar.sizeToFit()
           searchBar.isTranslucent = false
           searchBar.backgroundImage = UIImage()
           searchBar.delegate = self
           navigationItem.titleView = searchBar
    }
    @objc func didPullToRefresh() {
        viewModel.viewDidLoad()
    }
    private func updateUI() {
        if viewModel.numberOfRows == 0 && isSearchActive {
               tableView.setEmptyMessage("No record found.")
           } else {
               self.tableView.restore()
           }
    }
    private func bind(to viewModel: CharacterListViewModel) {
        viewModel.viewStateUpdated = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .loading:
                self.tableView.refreshControl?.beginRefreshing()
            case .loaded:
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            case .failed(let error):
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                    self.showAlert(with: "Error", and: error)
                }
            }
        }
        title = viewModel.title
    }
}

// MARK: - TableView DataSource
extension CharacterListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        updateUI()
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as CharacterTableViewCell
        cell.configure(with: viewModel.row(at: indexPath.row))
        return cell
    }
}

// MARK: - TableView Delegate
extension CharacterListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemSelected?(viewModel.getSelectedItem(at: indexPath.row))

    }
}

// MARK: - SearchBar Delegate

extension CharacterListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearchActive = !searchText.isEmpty
        viewModel.filter(by: searchText)
        tableView.reloadData()
    }
}
