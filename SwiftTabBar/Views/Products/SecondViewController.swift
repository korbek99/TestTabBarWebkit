//
//  SecondViewController.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//
import UIKit

@available(iOS 13.0, *)
class SecondViewController: UIViewController {
    
    private let viewModel = ProductViewModel()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Products"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(SecondTableViewCell.self, forCellReuseIdentifier: "SecondTableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = .orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        setupUI()
        searchBar.delegate = self
        viewModel.filteredProducts = viewModel.products
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

@available(iOS 13.0, *)
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.contentView.subviews.forEach { $0.removeFromSuperview() } // Limpiar subviews
        
        let product = viewModel.product(at: indexPath.row)
        
        let itemNameLabel = createLabel(with: product.itemName, font: UIFont.systemFont(ofSize: 16))
        let descLabel = createLabel(with: product.description, font: UIFont.systemFont(ofSize: 12), textColor: .gray)
        let photoImageView = createImageView(with: product.photo)
        
        cell.contentView.addSubview(itemNameLabel)
        cell.contentView.addSubview(descLabel)
        cell.contentView.addSubview(photoImageView)

        setupCellConstraints(photoImageView: photoImageView, itemNameLabel: itemNameLabel, descLabel: descLabel, in: cell)
    }
    
    private func createLabel(with text: String, font: UIFont, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createImageView(with photoURL: String?) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        if let imageURL = photoURL, let url = URL(string: imageURL) {
            imageView.loadImage(from: url)
        } else {
            imageView.image = UIImage(named: "notphoto")
        }
        return imageView
    }

    private func setupCellConstraints(photoImageView: UIImageView, itemNameLabel: UILabel, descLabel: UILabel, in cell: UITableViewCell) {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
            photoImageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            itemNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 5),
            itemNameLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
            itemNameLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),

            descLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
            descLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 5),
            descLabel.trailingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToDetailsViewController(at: indexPath)
    }

    private func navigateToDetailsViewController(at indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let selectedProduct = viewModel.product(at: indexPath.row)
        detailsVC.strImage = selectedProduct.photo ?? ""
        detailsVC.strLabel = selectedProduct.description
        detailsVC.websiteURL = selectedProduct.website
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteProduct(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

@available(iOS 13.0, *)
extension SecondViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterProducts(with: searchText)
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        viewModel.filterProducts(with: "")
        tableView.reloadData()
    }
}
