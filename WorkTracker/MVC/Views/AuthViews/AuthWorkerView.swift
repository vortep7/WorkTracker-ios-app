//
//  AuthWorkerView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit
import Foundation

final class AuthWorkerView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "alisa")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let vkButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "vk"), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
      
        return button
    }()
    

    private let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ghnew"), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
 
        return button
    }()

    private let telegramButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "tg"), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
       
        return button
    }()

    
    var textFieldEmail:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder =  "  Enter the email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    var textFieldPassword:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder =  "  Enter the password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .firstColor
        button.tintColor = .white
        button.setTitle("Do you have account?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 19)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        
        
        return button
    }()
    
    var resultButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .firstColor
        button.tintColor = .white
        button.setTitle("To perform", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 42)
        label.text = "Worker"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onResultAction: (() -> Void)?
    var onVkAction: (() -> Void)?
    var onGoogleAction: (() -> Void)?
    var onTgAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -660),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
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
    
    private func setupMessengers() {
        
        addSubview(vkButton)
        addSubview(googleButton)
        addSubview(telegramButton)
        
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vkButton.widthAnchor.constraint(equalToConstant: 50),
            vkButton.heightAnchor.constraint(equalToConstant: 50),
            vkButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            vkButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
        
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            googleButton.widthAnchor.constraint(equalToConstant: 60),
            googleButton.heightAnchor.constraint(equalToConstant: 60),
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            googleButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35)
        ])
        
        telegramButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            telegramButton.widthAnchor.constraint(equalToConstant: 50),
            telegramButton.heightAnchor.constraint(equalToConstant: 50),
            telegramButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 40),
            telegramButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }

    
    func constraintsForResultButton() {
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 650),
            resultButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            resultButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            resultButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
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
            textFieldPassword.topAnchor.constraint(equalTo: self.topAnchor, constant: 410),
            textFieldPassword.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -430),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    
    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 580),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -270),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
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
    func actionForButton() {
        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        resultButton.addTarget(self, action: #selector(secAction), for: .touchUpInside)
        vkButton.addTarget(self, action: #selector(vkButtonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        telegramButton.addTarget(self, action: #selector(tgButtonTapped), for: .touchUpInside)

    }
    
    private func addDecorationToTextFields() {
        let emailImageView = UIImageView(image: UIImage(named: "email_icon"))
        emailImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        emailImageView.contentMode = .scaleAspectFit
        textFieldEmail.leftView = emailImageView
        textFieldEmail.leftViewMode = .always
        
        let passwordImageView = UIImageView(image: UIImage(named: "password_icon"))
        passwordImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        passwordImageView.contentMode = .scaleAspectFit
        textFieldPassword.leftView = passwordImageView
        textFieldPassword.leftViewMode = .always
    }

    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(textFieldEmail)
        self.addSubview(label)
        self.addSubview(textFieldPassword)
        self.addSubview(infoButton)
        self.addSubview(resultButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupMessengers()
        createConstraints()
        actionForButton()
        addDecorationToTextFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - create action for buttons
extension AuthWorkerView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    @objc func secAction() {
        onResultAction?()
    }
    
    @objc func vkButtonTapped() {
        onVkAction?()
    }
    
    @objc func googleButtonTapped() {
        onGoogleAction?()
    }
    
    @objc func tgButtonTapped() {
        onTgAction?()
    }

}

//MARK: - animation for buttons
extension AuthWorkerView {
    
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

extension AuthWorkerView {
    public func changeText(_ result: Bool) {
        switch result{
        case true: label.text = "Registration"
        case false: label.text = "Entrance"
        }
    }
    
    public func changeTextForButton(_ result: Bool) {
        switch result{
        case true: infoButton.setTitle("Do you have account?", for: .normal)
        case false: infoButton.setTitle("Registration", for: .normal)
        }
    }
}
