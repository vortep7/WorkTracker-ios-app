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
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var firstTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5) // Прозрачный фон
        textField.layer.cornerRadius = 10 // Закругленные углы
        textField.layer.borderWidth = 1 // Толщина границы
        textField.layer.borderColor = UIColor.lightGray.cgColor // Цвет границы
        textField.textAlignment = .center // Выравнивание текста по центру
        textField.placeholder = "ФИО" // Плейсхолдер
        return textField
    }()
    
    var SecondTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5) // Прозрачный фон
        textField.layer.cornerRadius = 10 // Закругленные углы
        textField.layer.borderWidth = 1 // Толщина границы
        textField.layer.borderColor = UIColor.lightGray.cgColor // Цвет границы
        textField.textAlignment = .center // Выравнивание текста по центру
        textField.placeholder = "ПОЧТА" // Плейсхолдер
        return textField
    }()
    
    var thirdTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5) // Прозрачный фон
        textField.layer.cornerRadius = 10 // Закругленные углы
        textField.layer.borderWidth = 1 // Толщина границы
        textField.layer.borderColor = UIColor.lightGray.cgColor // Цвет границы
        textField.textAlignment = .center // Выравнивание текста по центру
        textField.placeholder = "ДАТА РОЖДЕНИЯ" // Плейсхолдер
        return textField
    }()
    
    var fourthTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 1, alpha: 0.5) // Прозрачный фон
        textField.layer.cornerRadius = 10 // Закругленные углы
        textField.layer.borderWidth = 1 // Толщина границы
        textField.layer.borderColor = UIColor.lightGray.cgColor // Цвет границы
        textField.textAlignment = .center // Выравнивание текста по центру
        textField.placeholder = "О СЕБЕ" // Плейсхолдер
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
    
    var imageViewMy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true // Добавленная строка для обрезки содержимого по границам скругленного слоя
        return imageView
    }()
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

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
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300), // Поднимаем на 100 единиц от нижнего края
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            firstTextField.heightAnchor.constraint(equalToConstant: 60) // Устанавливаем высоту текстового поля
        ])
    }
    
    func constraintsForMyImageView() {
        imageViewMy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewMy.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            imageViewMy.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            imageViewMy.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            imageViewMy.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }

    func constraintsForSecondTextField() {
        SecondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SecondTextField.bottomAnchor.constraint(equalTo: firstTextField.topAnchor, constant: -20), // Располагаем второе текстовое поле выше первого на 20 поинтов
            SecondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            SecondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            SecondTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor) // Используем высоту первого текстового поля
        ])
    }

    func constraintsForThirdTextField() {
        thirdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdTextField.bottomAnchor.constraint(equalTo: SecondTextField.topAnchor, constant: -20), // Располагаем третье текстовое поле выше второго на 20 поинтов
            thirdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            thirdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            thirdTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor) // Используем высоту первого текстового поля
        ])
    }

    func constraintsForFourthTextField() {
        fourthTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthTextField.bottomAnchor.constraint(equalTo: thirdTextField.topAnchor, constant: -20), // Располагаем четвертое текстовое поле выше третьего на 20 поинтов
            fourthTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            fourthTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            fourthTextField.heightAnchor.constraint(equalTo: firstTextField.heightAnchor) // Используем высоту первого текстового поля
        ])
    }

    func constraintsForFourthUploadButton() {
        uploadPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uploadPhotoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            uploadPhotoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110),
            uploadPhotoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            uploadPhotoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
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
    }
    
    //MARK: - setup action for buttons
//    func actionForButton() {
//        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
//        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
//    }
    
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
        
//        animationForButton(button: infoButton)
//        animationForButton(button: nextButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
//        actionForButton()
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
