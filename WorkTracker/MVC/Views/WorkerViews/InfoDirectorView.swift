//
//  InfoDirectorView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class InfoDirectorView: UIView {
    
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
    
    var button:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .red
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    let tableViewAll: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .white
        return tableView
    }()
    
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?

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
    
    func constraintsbutton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
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
    
    //MARK: - setup action for buttons
    func actionForButton() {
        button.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsTableView()
        constraintsbutton()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)
        self.addSubview(button)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        actionForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoDirectorView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
   
}
