//
//  AttentionCollection.swift
//  WorkTracker
//
//  Created by Андрей Петров on 12.04.2024.
//
import UIKit
import Foundation

class AttentionCollectionTable: UITableViewCell {
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    let indexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    func setupTableCell() {
        addSubview(startTimeLabel)
        addSubview(endTimeLabel)
        addSubview(usernameLabel)
        addSubview(indexLabel)
        
        startTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            startTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            startTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            endTimeLabel.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 4),
            endTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            endTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            usernameLabel.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 4),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            indexLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            indexLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20) 
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
