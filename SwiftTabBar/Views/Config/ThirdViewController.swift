//
//  ThirdViewController.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//
import UIKit

@available(iOS 11.0, *)
class ThirdViewController: UIViewController {
    
 
    let options = ["Notification", "Opción 2", "Opción 3", "Opción 4", "Opción 5"]
    var selectedOptions: [Bool] = [false, false, false, false, false]

    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
        table.rowHeight = 60.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Config"
        setupUX()
    }
    
    func setupUX() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

@available(iOS 11.0, *)
extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        
        cell.textLabel?.text = options[indexPath.row]
        
        
        let switchControl = UISwitch()
        switchControl.isOn = selectedOptions[indexPath.row]
        switchControl.tag = indexPath.row // Usamos el índice como tag para identificar
        switchControl.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchControl
        
        return cell
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        
        selectedOptions[sender.tag] = sender.isOn
        print("Opción \(options[sender.tag]) está ahora \(sender.isOn ? "activada" : "desactivada")")
    }
}
