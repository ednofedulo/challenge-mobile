//
//  OrdersOverviewTableViewCell.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class OrdersOverviewTableViewCell: UITableViewCell {
    
    var orders:[Order]?
    
    var index:Int?
    
    var currentOrder:Order? {
        get {
            guard let orders = orders, let index = index else { return nil }
            return orders[index]
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    lazy var statusesStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    func setup(orders:[Order]) {
        self.orders = orders
        self.index = 0
        refresh()
    }
    
    func refresh(){
        if let currentOrder = currentOrder {
            titleLabel.text = "#\(currentOrder.order_id!) \(currentOrder.submodel_name!)"
            
            statusesStackView.arrangedSubviews.forEach { (view) in
                statusesStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            
            if let statuses = currentOrder.statuses {
                for status in statuses {
                    let label = UILabel()
                    label.text = "\(status.checked! ? "✅" : "⬜️") \(status.label!)"
                    statusesStackView.addArrangedSubview(label)
                }
            }
        }
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        self.contentView.addSubview(backButton)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(nextButton)
        self.contentView.addSubview(statusesStackView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            backButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            nextButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            statusesStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            statusesStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15),
            statusesStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.contentView.bottomAnchor.constraint(equalTo: statusesStackView.bottomAnchor, constant: 15)
        ])
    }
    
    @objc func didTapNextButton(){
        guard let orders = orders, let index = index, orders.count > index + 1 else { return }
        
        self.index = self.index! + 1
        refresh()
    }
    
    @objc func didTapBackButton(){
        
        guard let index = self.index, index > 0 else { return }
        self.index = self.index! - 1
        refresh()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
