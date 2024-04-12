//
//  DataPresentView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

import UIKit
import Lottie

class DataPresentView: UIView {
    
    //MARK: - UI elements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pig")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let bigAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Present")
//        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Enter your name"
        label.textColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        return label
    }()

    var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Specify your email address"
        label.textColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        return label
    }()

    var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Specify additional information"
        label.textColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        return label
    }()

    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Specify the date of birth"
        label.textColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
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
            
            nameLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: -110),
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
            
            exitButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 200),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.widthAnchor.constraint(equalToConstant: 200),
            exitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func constraintsForBigAnimation() {
        addSubview(bigAnimationView)
        bigAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigAnimationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            bigAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            bigAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            bigAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func setupAnimations() {
        bigAnimationView.loopMode = .loop
        bigAnimationView.play()
       
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
        constraintsForBigAnimation()
        setupAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Button Actions
    
    @objc private func exit() {
        onNextAction?()
    }
}
