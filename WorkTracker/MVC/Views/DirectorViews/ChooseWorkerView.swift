//
//  ChooseWorkerView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class ChooseWorkerView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var firstDirector:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.tintColor = .red
        button.setTitle("Команда менеджерей", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var secondDirector:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.tintColor = .red
        button.setTitle("Команда IT", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var thirdDirector:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.tintColor = .red
        button.setTitle("Аналитики", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var fourthDirector:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .black
        button.tintColor = .red
        button.setTitle("Уборщики", for: .normal)
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
    var onNextAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsFirstDirector() {
        firstDirector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstDirector.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            firstDirector.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstDirector.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            firstDirector.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func constraintsSecondDirector() {
        secondDirector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondDirector.bottomAnchor.constraint(equalTo: firstDirector.topAnchor, constant: -20),
            secondDirector.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            secondDirector.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            secondDirector.heightAnchor.constraint(equalTo: firstDirector.heightAnchor)
        ])
    }
    
    func constraintsFourthDirector() {
        fourthDirector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthDirector.bottomAnchor.constraint(equalTo: thirdDirector.topAnchor, constant: -20),
            fourthDirector.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            fourthDirector.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            fourthDirector.heightAnchor.constraint(equalTo: firstDirector.heightAnchor)
        ])
    }
    
    func constraintsThirdDirector() {
        thirdDirector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdDirector.bottomAnchor.constraint(equalTo: secondDirector.topAnchor, constant: -20),
            thirdDirector.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            thirdDirector.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            thirdDirector.heightAnchor.constraint(equalTo: secondDirector.heightAnchor)
        ])
    }
    
    func actionForButton() {
        firstDirector.addTarget(self, action: #selector(firstAction), for: .touchUpInside)
        secondDirector.addTarget(self, action: #selector(secondAction), for: .touchUpInside)
        thirdDirector.addTarget(self, action: #selector(thirdAction), for: .touchUpInside)
        fourthDirector.addTarget(self, action: #selector(fourthAction), for: .touchUpInside)
    }
    
    //MARK: - clousers for buttons action
    var onFirst: (() -> Void)?
    var onSecond: (() -> Void)?
    var onThird: (() -> Void)?
    var onFourth: (() -> Void)?

    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsFirstDirector()
        constraintsSecondDirector()
        constraintsThirdDirector()
        constraintsFourthDirector()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(firstDirector)
        self.addSubview(secondDirector)
        self.addSubview(thirdDirector)
        self.addSubview(fourthDirector)

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

extension ChooseWorkerView {
    @objc func firstAction() {
        onFirst?()
    }
    
    @objc func secondAction() {
        onSecond?()
    }
    
    @objc func thirdAction() {
        onThird?()
    }
    
    @objc func fourthAction() {
        onFourth?()
    }
}
