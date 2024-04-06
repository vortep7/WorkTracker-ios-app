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
    
    var textField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder = " +7 XXX XXX XX XX"
        return textField
    }()
    
    var infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .white
        button.setTitle("Получить код", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.alpha = 0.4
        button.isEnabled = false
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 44)
        label.text = "Director"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 340),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 430),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLogButton()
        constraintsForLabel()
        constraintsForInfoButton()
        constraintsImageView()
    }
    
    //MARK: - setup action for buttons
    func createTarget() {
        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(textField)
        self.addSubview(label)
        self.addSubview(infoButton)
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
