//
//  DirectorCodeView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 06.04.2024.
//

import UIKit

final class MainDirectorView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    var infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .white
        button.setTitle("Я ливаю", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var nextButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .red
        button.setTitle("Следующая", for: .normal)
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
        label.font = UIFont(name: "Vetrino", size: 30)
        label.text = "Я директор"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

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
    
    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 390),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 550),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLabel()
        constraintsForInfoButton()
        constraintsImageView()
        constraintsForNextButton()
    }
    
    //MARK: - setup action for buttons
    func actionForButton() {
        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(infoButton)
        self.addSubview(nextButton)
        
        animationForButton(button: infoButton)
        animationForButton(button: nextButton)
        
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

extension MainDirectorView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    
    @objc func nextButtonAction() {
        onNextAction?()
    }
}


extension MainDirectorView {
    
    func animationForButton(button: UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        button.alpha = 0.0
        UIView.animate(withDuration: 0.8, delay: 1.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            button.transform = .identity
            button.alpha = 1.0
        }, completion: nil)
    }
}
