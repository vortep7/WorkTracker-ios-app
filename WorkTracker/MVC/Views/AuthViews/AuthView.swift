//
//  AuthView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit
import Lottie

final class AuthView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "auth")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let bigAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "pep")
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private let logButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .secondColor
        button.tintColor = .white
        button.setTitle("Worker", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 20)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .secondColor
        button.tintColor = .white
        button.setTitle("Director", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 20)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 44)
        label.text = "WorkTracker"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.white.cgColor // Добавление тени
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    private let myLabel: UILabel = {
      let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 30)
        label.text = "Developed by IftisHackers"
        label.textColor = .systemOrange
        return label
    }()
    
    
    //MARK: - clousers for buttons action
    var onLogButtonAction: (() -> Void)?
    var onInfoButtonAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 55),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForBigAnimation() {
        bigAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigAnimationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            bigAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            bigAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            bigAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }


    
    func constraintsForMyLabel() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 650),
            myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            myLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            myLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
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
        logButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logButton.widthAnchor.constraint(equalToConstant: 300),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 680)
        ])
    }

    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.widthAnchor.constraint(equalToConstant: 300),
            infoButton.heightAnchor.constraint(equalToConstant: 50),
            infoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoButton.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 20) 
        ])
    }
    
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLogButton()
        constraintsForLabel()
        constraintsForInfoButton()
        constraintsImageView()
        constraintsForBigAnimation()
//        constraintsForMyLabel()
    }
    
    //MARK: - setup action for buttons
    func createTargets() {
        logButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(infoButtonAction), for: .touchUpInside)

    }
    
    func setupAnimations() {
        bigAnimationView.loopMode = .loop
        bigAnimationView.play()
       
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(logButton)
        self.addSubview(label)
        self.addSubview(infoButton)
        self.addSubview(bigAnimationView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        createTargets()
        setupAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - create action for buttons
extension AuthView {
    @objc func logButtonAction() {
        onLogButtonAction?()
    }
    
    @objc func infoButtonAction() {
        onInfoButtonAction?()
    }
}

//MARK: - animation for buttons
extension AuthView {
    func animationForLogButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.logButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.logButton.transform = CGAffineTransform.identity
            }
        }
    }
    
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
