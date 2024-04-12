//
//  DataWorkerView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

final class DataWorkerView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dj")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.gray
        return toolbar
    }()
    
    private let toolbarLabel: UILabel = {
        let label = UILabel()
        label.text = "My Account"
        label.textColor = .black
        label.font = UIFont(name: "Vetrino", size: 23)
        label.textAlignment = .center
        return label
    }()
    
    let buttonPerson: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        return button
    }()
    
    let buttonDirector: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.3.sequence"), for: .normal)
        return button
    }()
    
    var firstTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.placeholder = "name"
        return textField
    }()
    
    var SecondTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.placeholder = "position (работник/директор)"
        return textField
    }()
    
    var thirdTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.placeholder = "date of birth"
        return textField
    }()
    
    var fourthTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.placeholder = "email"
        return textField
    }()
       
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 30)
        label.text = "Основной экран работника"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var uploadPhotoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .firstColor
        button.tintColor = .red
        
        button.setTitle("Add a photo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var saveButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .firstColor
        button.tintColor = .red
        button.setTitle("Save changes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var imageViewMy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "none")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?
    var onPresentAction: (() -> Void)?
    var onDirectorAction: (() -> Void)?
    var onChooseAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -700),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintForPersonButton() {
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPerson.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: 175),
            buttonPerson.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 25)
        ])
    }
    
    func constraintForDirectorButton() {
        buttonDirector.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonDirector.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: -175),
            buttonDirector.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 25)
        ])
    }
    
    func costraintsForToolBarLabel() {
        toolbarLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toolbarLabel.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor),
            toolbarLabel.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 24)
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
    
    
    
    func constraintsForFirstTextField() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -370),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            firstTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func constraintsForMyImageView() {
        imageViewMy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewMy.topAnchor.constraint(equalTo: self.topAnchor, constant: 115),
            imageViewMy.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -630),
            imageViewMy.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            imageViewMy.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120)
        ])
    }

    func constraintsForSecondTextField() {
        SecondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SecondTextField.bottomAnchor.constraint(equalTo: firstTextField.topAnchor, constant: -10),
            SecondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            SecondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            SecondTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor)
        ])
    }

    func constraintsForThirdTextField() {
        thirdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdTextField.bottomAnchor.constraint(equalTo: SecondTextField.topAnchor, constant: -10),
            thirdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            thirdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            thirdTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor)
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
        
    
    func constraintsForFourthTextField() {
        fourthTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthTextField.bottomAnchor.constraint(equalTo: thirdTextField.topAnchor, constant: -10),
            fourthTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            fourthTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            fourthTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor)
        ])
    }

    func constraintsForFourthUploadButton() {
        uploadPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uploadPhotoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 620),
            uploadPhotoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -220),
            uploadPhotoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            uploadPhotoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }

    func constraintsForButtonSave() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 710),
            saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }

    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForFirstTextField()
        constraintsForSecondTextField()
        constraintsImageView()
        constraintsForThirdTextField()
        constraintsForFourthTextField()
        constraintsForFourthUploadButton()
        constraintsForMyImageView()
        constraintsForButtonSave()
        constraintForToolBar()
        constraintForPersonButton()
        constraintForDirectorButton()
        costraintsForToolBarLabel()
    }
    
    //MARK: - setup action for buttons
    func actionForButton() {
        uploadPhotoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        buttonPerson.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        buttonDirector.addTarget(self, action: #selector(presentDirector), for: .touchUpInside)
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(firstTextField)
        self.addSubview(SecondTextField)
        self.addSubview(thirdTextField)
        self.addSubview(fourthTextField)
        self.addSubview(uploadPhotoButton)
        self.addSubview(imageViewMy)
        self.addSubview(saveButton)
        self.addSubview(toolBar)
        self.addSubview(buttonDirector)
        self.addSubview(buttonPerson)
        self.addSubview(toolbarLabel)
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

extension DataWorkerView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    
    @objc func nextButtonAction() {
        onNextAction?()
    }
    
    @objc func presentAction() {
        onPresentAction?()
    }
    
    @objc func presentDirector() {
        onDirectorAction?()
    }
    
    @objc func presentChoose() {
        onChooseAction?()
    }
}

extension DataWorkerView {
    
    func animationForButton(button: UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        button.alpha = 0.0
        UIView.animate(withDuration: 0.8, delay: 1.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            button.transform = .identity
            button.alpha = 1.0
        }, completion: nil)
    }
}
