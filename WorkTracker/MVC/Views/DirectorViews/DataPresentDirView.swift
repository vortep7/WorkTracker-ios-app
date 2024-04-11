//
//  DataPresentDirView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import UIKit
import Lottie

class DataPresentDirView: UIView {
    
    //MARK: - UI elements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "datal")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 20)
        label.text = "Enter your name"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 20)
        label.text = "Specify your email address"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 20)
        label.text = "Specify additional information"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 20)
        label.text = "Specify the date of birth"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .firstColor
        button.tintColor = .red
        button.setTitle("Exit", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var onNextAction: (() -> Void)?
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(infoLabel)
        addSubview(dateLabel)
        addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: -130),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            infoLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            dateLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            exitButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 260),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.widthAnchor.constraint(equalToConstant: 200),
            exitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - setup action for buttons
    func actionForButton() {
        exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
    }
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        actionForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Button Actions
    
    @objc private func exit() {
        onNextAction?()
    }
}
