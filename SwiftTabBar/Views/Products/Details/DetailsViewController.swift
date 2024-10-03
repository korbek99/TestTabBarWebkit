//
//  DetailsViewController.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    var strImage: String = ""
    var strLabel: String = ""
    var websiteURL: String = "" 
    
    let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    let websiteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Visit Manufacturer Website", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details Product"
        setupUX()

        websiteButton.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
    }
    
    func setupUX() {
        view.backgroundColor = .white
        view.addSubview(myImage)
        view.addSubview(myLabel)
        view.addSubview(websiteButton)
        
        NSLayoutConstraint.activate([
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            myImage.widthAnchor.constraint(equalToConstant: 200),
            myImage.heightAnchor.constraint(equalToConstant: 200),

            myLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 20),
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            websiteButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 20),
            websiteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
       
        if let url = URL(string: strImage) {
            myImage.loadImage(from: url)
        } else {
            myImage.image = UIImage(named: "notphoto")
        }
        
        myLabel.text = strLabel
    }

    @objc func websiteButtonTapped() {
        let webVC = WebViewController()
        webVC.urlString = websiteURL
        navigationController?.pushViewController(webVC, animated: true)
    }
}

