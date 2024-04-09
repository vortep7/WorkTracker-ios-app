//
//  BluetoothView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit

final class BluetoothView: UIView {
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
//        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Можете добавить свою BlueTooth сеть"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var networkNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя сети"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подключиться", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Удалить", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - Clousers and Actions
    
    var onConnectAction: (() -> Void)?
    var onDeleteAction: (() -> Void)?
    
    func constraintsTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }


    // MARK: - Constraints
    func constraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        networkNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            networkNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            networkNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            networkNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            networkNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: networkNameTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        connectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            connectButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            connectButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            connectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            connectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            deleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            deleteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func actionForButton() {
        connectButton.addTarget(self, action: #selector(actionForConnect), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(actionForDelete), for: .touchUpInside)

    }
    
    // MARK: - Setup
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(networkNameTextField)
        addSubview(passwordTextField)
        addSubview(connectButton)
        addSubview(deleteButton)
        addSubview(tableView)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        constraintsImageView()
        constraintsTableView()
        actionForButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BluetoothView {
    @objc func actionForConnect() {
        onConnectAction?()
    }
    
    @objc func actionForDelete() {
        onDeleteAction?()
    }
}
