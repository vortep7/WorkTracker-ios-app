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
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Мои работники"
        label.textColor = .white
     
        return label
    }()
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "(можете сгруппировать в отдел)"
        label.textColor = .black
     
        return label
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
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -730),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForLabelInfo() {
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 130),
            labelInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -680),
            labelInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    
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
        constraintsForLabel()
        constraintsForLabelInfo()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)
        self.addSubview(label)
        self.addSubview(labelInfo)
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



