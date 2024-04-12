//
//  MLDirectorView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class MLDirectorView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var myView: UIView = {
        let myView = UIView()
        return myView
    }()
    
    let buttonPerson: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "questionmark.bubble"), for: .normal)
        return button
    }()
    
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lasts")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.gray
        return toolbar
        }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 20)
        label.text = "Машинное обучение"
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 30)
        label.text = "Машинное обучение"
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
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
        ])
    }
    
    func constraintForPersonButton() {
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPerson.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: 175),
            buttonPerson.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 15)
        ])
    }

    func constraintsForSecondLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.secondLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -160)
        ])
    }

    func constraintsForMyView() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            myView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            myView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            myView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -0)
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
    
    func constraintForToolBar() {
            toolBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                toolBar.topAnchor.constraint(equalTo: self.topAnchor),
                toolBar.heightAnchor.constraint(equalToConstant: 95)
            ])
        }
        
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLabel()
        constraintsImageView()
        constraintForToolBar()
        constraintsForMyView()
        constraintsForSecondLabel()
        constraintForPersonButton()
    }
    
    func actionForButton() {
       
        buttonPerson.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
       
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(myView)
        self.addSubview(label)
        myView.addSubview(myImageView)
        self.addSubview(buttonPerson)
        self.addSubview(secondLabel)
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

extension MLDirectorView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
}


