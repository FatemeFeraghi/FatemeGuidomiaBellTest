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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = Provider.loadCars()
        configureUI()
        
    }
    
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "GUIDOMIA"
        
        view.addSubviews(carHeader, tableView, filterPanel)
        
        carHeader.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor, height: 280)
        
        filterPanel.anchor(top: carHeader.bottomAnchor,
                           left: view.safeAreaLayoutGuide.leftAnchor,
                           right: view.safeAreaLayoutGuide.rightAnchor,
                           paddingTop: 30, paddingLeft: 20,
                           paddingRight: -20, height: 150)
        
        
        filterPanel.layer.cornerRadius = 10
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        filterPanel.anchor(top: carHeader.bottomAnchor,
                           left: view.safeAreaLayoutGuide.leftAnchor,
                           right: view.safeAreaLayoutGuide.rightAnchor,
                           paddingTop: 30, paddingLeft: 20,
                           paddingRight: 20, height: 150)
        
        
        tableView.anchor(top: filterPanel.bottomAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor,paddingTop: 10)
        
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
