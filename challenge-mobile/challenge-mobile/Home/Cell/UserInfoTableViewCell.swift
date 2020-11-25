//
//  UserInfoTableViewCell.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit
import Kingfisher

class UserInfoTableViewCell: UITableViewCell {
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true

        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGreen
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        self.contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(locationLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            mainStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.contentView.bottomAnchor.constraint(equalTo: self.mainStackView.bottomAnchor)
        ])
    }
    
    func setup(avatarUrl:String, name:String, city:String, state:String) {
        if let url = URL(string: avatarUrl) {
            self.avatarImageView.kf.indicatorType = .activity
            self.avatarImageView.kf.setImage(with: url)
        }
        
        self.nameLabel.text = name
        self.locationLabel.text = "\(city) - \(state)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
