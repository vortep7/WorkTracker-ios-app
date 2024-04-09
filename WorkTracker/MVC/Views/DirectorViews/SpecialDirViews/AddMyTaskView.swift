//
//  AddMyTaskView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit
import UIKit

final class AddMyTaskView: UIView {
    
    //MARK: - UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите информацию"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var addButton:UIButton = {
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
    
    //MARK: - Constraints
    
    private func setupConstraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupConstraintsForAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 650),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
        ])
    }
    
    func actionForButton() {
        addButton.addTarget(self, action: #selector(myAction), for: .touchUpInside)
    }
    
    func setupConstraints() {
        setupConstraintsForImageView()
        constraintForTextField()
        setupConstraintsForAddButton()
    }
    
    private func constraintForTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    var onNumberAction: (() -> Void)?

    //MARK: - Animation
    
    private func animateLabel() {
        let label = UILabel()
        label.text = "Добавить свои таски"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200)
        ])
        
        UIView.animate(withDuration: 1.0, animations: {
            label.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 1.0, delay: 2.0, options: [], animations: {
                label.alpha = 0.0
            }, completion: { (_) in
                label.removeFromSuperview()
            })
        }
    }
    
    //MARK: - Setup views
    private func setupViews() {
        self.addSubview(imageView)
        self.addSubview(textField)
        self.addSubview(addButton)
    }
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        actionForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            animateLabel()
        }
    }
}

extension AddMyTaskView {
    @objc func myAction() {
        onNumberAction?()
    }
}
