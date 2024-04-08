//
//  DataPresentDirView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class DataPresentDirView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var labelNamed: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 22)
        label.text = "Укажите ваше имя"
        label.textColor = .white
        label.clipsToBounds = true

        label.backgroundColor = .cyan
        label.layer.cornerRadius = 10
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 22)
        label.text = "Укажите вашу почту"
        label.textColor = .white
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 10
        label.clipsToBounds = true

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var exitButton:UIButton = {
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
    
    var labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 22)
        label.text = "Укажите доп. информацию"
        label.textColor = .white
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 10
        label.clipsToBounds = true

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var labelDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 22)
        label.text = "Укажите дату рождения"
        label.textColor = .white
        label.backgroundColor = .cyan
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    func actionForButton() {
        exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
    }
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsForLabelName() {
        labelNamed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelNamed.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            labelNamed.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -680),
            labelNamed.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelNamed.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForExitButtone() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            exitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func constraintsForLabelEmail() {
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            labelEmail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -580),
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForLabelInfo() {
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            labelInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -480),
            labelInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForLabelDate() {
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            labelDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -380),
            labelDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
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
    
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLabelName()
        constraintsForLabelDate()
        constraintsForLabelInfo()
        constraintsForLabelEmail()
        constraintsImageView()
        constraintsForExitButtone()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(labelNamed)
        self.addSubview(labelEmail)
        self.addSubview(labelInfo)
        self.addSubview(labelDate)
        self.addSubview(exitButton)
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

extension DataPresentDirView {
    @objc func exit() {
        onNextAction?()
    }
}
