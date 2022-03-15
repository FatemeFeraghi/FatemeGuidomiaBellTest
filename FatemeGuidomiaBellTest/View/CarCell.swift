//
//  CarCell.swift
//  FatemeGuidomiaBellTest
//
//  Created by Fateme Feraghi on 2022-03-12.
//

import Foundation
import UIKit


class CarCell: UITableViewCell {
    
    var viewModel: CarViewModel? {
        didSet { self.configure() }
    }
    
    var isListsHidden: Bool {
        return prosLabelTitle.isHidden && prosLabel.isHidden
            && consLabelTitle.isHidden && consLabel.isHidden
    }
    
    private let carImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Alpine_roadster")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let carLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: Constants.darkGray)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Car Name"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: Constants.darkGray)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Car Price"
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "★"
        label.textColor = UIColor(named: Constants.customOrange)
        return label
    }()
    
    private let prosLabelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: Constants.darkGray)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pros:"
        return label
    }()
    
    private let prosLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.autoresizesSubviews = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let consLabelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: Constants.darkGray)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cons:"
        return label
    }()
    
    private let consLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.autoresizesSubviews = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let whiteDivider : UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .white
        return divider
    }()
    private let redDivider : UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .red
        return divider
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        self.addSubviews(carImageView, carLabel, priceLabel, rateLabel, prosLabelTitle, prosLabel, consLabelTitle, consLabel, whiteDivider, redDivider)
        
        self.backgroundColor = UIColor(named: "light_gray")
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        dividersConstraints()
        
        carImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        carImageView.topAnchor.constraint(equalTo: self.whiteDivider.bottomAnchor, constant: 20).isActive = true
        carImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        carImageView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
        carLabel.leadingAnchor.constraint(equalTo: self.carImageView.trailingAnchor, constant: 10).isActive = true
        carLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        carLabel.topAnchor.constraint(equalTo: self.carImageView.topAnchor).isActive = true
        carLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        priceLabel.leadingAnchor.constraint(equalTo: self.carImageView.trailingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: self.carLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rateLabel.leadingAnchor.constraint(equalTo: self.carImageView.trailingAnchor, constant: 10).isActive = true
        rateLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        rateLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 8).isActive = true
        rateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addProsAndConsConstraints()
        
    }

    func dividersConstraints() {
        whiteDivider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        whiteDivider.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        whiteDivider.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        whiteDivider.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        redDivider.centerXAnchor.constraint(equalTo: whiteDivider.centerXAnchor).isActive = true
        redDivider.centerYAnchor.constraint(equalTo: whiteDivider.centerYAnchor).isActive = true
        redDivider.heightAnchor.constraint(equalToConstant: 3).isActive = true
        redDivider.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func addProsAndConsConstraints() {
        prosLabelTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        prosLabelTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        prosLabelTitle.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 20).isActive = true
        prosLabelTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        prosLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        prosLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        prosLabel.topAnchor.constraint(equalTo: self.prosLabelTitle.bottomAnchor, constant: -5).isActive = true
        prosLabel.autoresizingMask = [.flexibleHeight]
        
        consLabelTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        consLabelTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        consLabelTitle.topAnchor.constraint(equalTo: self.prosLabel.bottomAnchor, constant: -5).isActive = true
        consLabelTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        consLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        consLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        consLabel.topAnchor.constraint(equalTo: self.consLabelTitle.bottomAnchor, constant: -5).isActive = true
        consLabel.autoresizingMask = [.flexibleHeight]
    }
    
    func showItems() {
        prosLabelTitle.isHidden = false
        prosLabel.isHidden = false
        consLabelTitle.isHidden = false
        consLabel.isHidden = false
    }
    
    func hideItems() {
        prosLabelTitle.isHidden = true
        prosLabel.isHidden = true
        consLabelTitle.isHidden = true
        consLabel.isHidden = true
    }
    
    //Handle showing and hiding prosList and consList when a cell is tapped
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if isListsHidden, selected {
            showItems()
        } else {
            hideItems()
        }
    }
    
    func configure() {
        
        guard let viewModel = viewModel else { return }
        
        carImageView.image = viewModel.carImage
        carLabel.text = viewModel.makeAndModel
        priceLabel.text = viewModel.price
        rateLabel.text = viewModel.rating
        
        prosLabelTitle.isHidden = viewModel.car.prosIsHidden()
        consLabelTitle.isHidden = viewModel.car.consIsHidden()
        
        if !prosLabelTitle.isHidden {
            let prosList = viewModel.prosList.filter{ $0.isEmpty == false}
            prosLabel.attributedText = NSAttributedString().displayProssAndCons(prosList)
        } else{
            prosLabelTitle.text = ""
        }
        
        if !consLabelTitle.isHidden {
            let consList = viewModel.constList.filter{ $0.isEmpty == false}
            consLabel.attributedText = NSAttributedString().displayProssAndCons(consList)
        } else {
            consLabelTitle.text = ""
        }
        
    }
    
}
