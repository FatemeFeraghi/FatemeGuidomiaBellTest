//
//  ViewController.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import UIKit

private let carCellIdentifier = "CarCell"

class ViewController: UIViewController {
    
    private let tableView = UITableView()

    private let carHeader = CarHeader()
    
    private var cars = [Car]() {
        didSet { tableView.reloadData() }
    }
    
    
    var provider: Provider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        cars = Provider.loadCars() 
        configureUI()
        navigationItem.title = "GUIDOMIA"
        navigationController?.navigationBar.barStyle = .black
        
    }
    
    func configureUI() {

        view.addSubview(carHeader)
        carHeader.translatesAutoresizingMaskIntoConstraints = false
        
        carHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        carHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        carHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        carHeader.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: carHeader.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(CarCell.self, forCellReuseIdentifier: carCellIdentifier)
        
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: carCellIdentifier, for: indexPath) as! CarCell
        cell.viewModel = CarViewModel(car: cars[indexPath.row])
        tableView.rowHeight = 200
        return cell
    }
}


