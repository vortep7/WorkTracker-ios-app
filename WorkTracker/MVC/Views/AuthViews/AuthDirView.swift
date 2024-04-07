//
//  AuthDirView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//
import UIKit
import Foundation

final class AuthDirView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var textFieldEmail:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder =  " введите почту"
        return textField
    }()
    
    var textFieldPassword:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder =  " введите пароль"
        return textField
    }()
    
    var infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .white
        button.setTitle("У вас уже есть аккаунт?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 34)
        label.text = "Директор (рег)"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var resultButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .white
        button.setTitle("Выполнить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        
        
        return button
    }()
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onResultAction: (() -> Void)?
    //MARK: - constraints
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
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
    
    
    func constraintsForLogButton() {
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldEmail.topAnchor.constraint(equalTo: self.topAnchor, constant: 340),
            textFieldEmail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForPassword() {
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldPassword.topAnchor.constraint(equalTo: self.topAnchor, constant: 430),
            textFieldPassword.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 530),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForResultButton() {
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 650),
            resultButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            resultButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            resultButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLogButton()
        constraintsForLabel()
        constraintsForInfoButton()
        constraintsImageView()
        constraintsForPassword()
        constraintsForResultButton()
    }
    
    //MARK: - setup action for buttons
    func createTarget() {
        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        resultButton.addTarget(self, action: #selector(secAction), for: .touchUpInside)
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(textFieldEmail)
        self.addSubview(textFieldPassword)
        self.addSubview(label)
        self.addSubview(infoButton)
        self.addSubview(resultButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        createTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - create action for buttons
extension AuthDirView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    
    @objc func secAction() {
        onResultAction?()
    }
}

//MARK: - animation for buttons
extension AuthDirView {
    
    func animationForInfoButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.infoButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.infoButton.transform = CGAffineTransform.identity
            }
        }
    }
}

extension AuthDirView {
    public func changeText(_ result: Bool) {
        switch result{
        case true: label.text = "Регистрация"
        case false: label.text = "Вход"
        }
    }
    
    public func changeTextForButton(_ result: Bool) {
        switch result{
        case true: infoButton.setTitle("У вас уже есть аккаунт?", for: .normal)
        case false: infoButton.setTitle("Регистрация", for: .normal)
        }
    }
}
