//
//  FirstViewController.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class FirstViewController: UIViewController {

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search People"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
        tableView.rowHeight = 200.0
        tableView.separatorColor = .orange
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var viewModel = PeopleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "People"
        setupUI()
        searchBar.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        configureSearchBar()
        configureTableView()
    }

    private func configureSearchBar() {
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

@available(iOS 11.0, *)
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
        configureCell(cell, at: indexPath)
        return cell
    }
    
    private func configureCell(_ cell: FirstTableViewCell, at indexPath: IndexPath) {
        let person = viewModel.person(at: indexPath.row)
        let image = UIImage(named: person.profilePhoto)
        let name = "\(person.firstName) \(person.lastName)"
        let dob = "\(person.age) años"
        cell.configureItems(with: image, name: name, dob: dob)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToDetailViewController(at: indexPath)
    }

    private func navigateToDetailViewController(at indexPath: IndexPath) {
        let detailsVC = DetailViewController()
        let selectedPerson = viewModel.person(at: indexPath.row)
        detailsVC.imageString = selectedPerson.profilePhoto
        detailsVC.nameString = "\(selectedPerson.firstName) \(selectedPerson.lastName)"
        detailsVC.dobString = "\(selectedPerson.age)"
        detailsVC.latitude = selectedPerson.latitude
        detailsVC.longitude = selectedPerson.longitude
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Manejar eliminación de filas
            // Implementar lógica para eliminar la persona de la vista y del modelo
        }
    }
}

@available(iOS 11.0, *)
extension FirstViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterPeoples(with: searchText)
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        viewModel.filterPeoples(with: "")
        tableView.reloadData()
    }
}
