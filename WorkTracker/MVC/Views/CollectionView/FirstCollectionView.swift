//
//  FirstCollectionView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 10.04.2024.
//

import Foundation


import UIKit

class FirstCollectionView: UICollectionViewCell {
    
    //MARK: - create UI elements for cell
    var quality: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "abosanova", size: 30)
        name.textColor = .white
        return name
    }()
    
    var plans: UILabel = {
        let price = UILabel()
        price.textColor = .white
        price.numberOfLines = 5
        price.font = .boldSystemFont(ofSize: 16)
        return price
    }()
    
    var imageView: UIImageView = {
        let Image = UIImageView()
        return Image
    }()
    
    var specialLabel: UILabel = {
        let label = UILabel()
        label.text = "Необходимо выполнить:"
        label.textColor = .brown
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    //MARK: - constraints for cell elements
    func setupCell() {
        quality.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(quality)
    
        plans.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(plans)
        
        specialLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(specialLabel)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(separatorView)
                
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -170),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -260)
        ])
        
        
        NSLayoutConstraint.activate([
            quality.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            quality.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10)
        ])
        NSLayoutConstraint.activate([
            plans.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 190),
            plans.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            plans.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            plans.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            specialLabel.bottomAnchor.constraint(equalTo: plans.topAnchor, constant: -4),
            specialLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
                separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                separatorView.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
                separatorView.heightAnchor.constraint(equalToConstant: 2)
            ])
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        self.layer.cornerRadius = 40
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

