//
//  InfoAllWorkView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation

import UIKit
import Foundation

final class InfoAllWorkView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .white
        return tableView
    }()
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }


    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsTableView()
        
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



