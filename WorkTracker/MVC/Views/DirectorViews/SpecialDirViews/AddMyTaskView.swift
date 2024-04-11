//
//  AddMyTaskView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit
import UIKit

final class AddMyTaskView: UIView {
    
    //MARK: - UI elements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mans")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add your own tasks"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter the information"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var addButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    
    func actionForButton() {
        addButton.addTarget(self, action: #selector(myAction), for: .touchUpInside)
    }
    
    var onNumberAction: (() -> Void)?
    
    //MARK: - Constraints
    
    func constraintsImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupConstraintsForTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupConstraintsForTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    private func setupConstraintsForAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 150),
            addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    //MARK: - Setup views
    private func setupViews() {
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(addButton)
    }
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintsImageView()
        actionForButton()
        setupConstraintsForTitleLabel()
        setupConstraintsForTextField()
        setupConstraintsForAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddMyTaskView {
    @objc func myAction() {
        onNumberAction?()
    }
}
