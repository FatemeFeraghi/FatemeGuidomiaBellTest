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
    private let filterPanel = FilterPanel()
    
    var expandedIndexPath = IndexPath()
    
    private var cars = [Car]() {
        didSet { tableView.reloadData() }
    }
    
    private var filteredItems = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = Provider.loadCars()
        
        configureUI()
        
    }
    
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "GUIDOMIA"
        
        view.addSubview(carHeader)
        carHeader.translatesAutoresizingMaskIntoConstraints = false
        
        carHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        carHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        carHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        carHeader.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        
        view.addSubviews(filterPanel)
        filterPanel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        filterPanel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        filterPanel.topAnchor.constraint(equalTo: carHeader.bottomAnchor, constant: 30).isActive = true
        filterPanel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        filterPanel.layer.cornerRadius = 10
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: filterPanel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(CarCell.self, forCellReuseIdentifier: carCellIdentifier)
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
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
        tableView.rowHeight = 340
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        
        if indexPath == expandedIndexPath {
            expandedIndexPath = IndexPath()
        } else {
            expandedIndexPath = indexPath
        }
        
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == expandedIndexPath {
            return 340
        }
        
        return 130
    }
    
}
