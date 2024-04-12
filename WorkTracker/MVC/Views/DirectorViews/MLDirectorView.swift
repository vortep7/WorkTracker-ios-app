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
    
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "firstFon")
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
        label.font = UIFont(name: "Vetrino", size: 30)
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
            secondLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    func constraintsForSecondLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.secondLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120)
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
    }
    
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(myView)
        self.addSubview(label)
        myView.addSubview(myImageView)
        self.addSubview(secondLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLDirectorView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    
    @objc func nextButtonAction() {
        onNextAction?()
    }
}


