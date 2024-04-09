//
//  DataPresentDirView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//
import UIKit
import Lottie

final class DataPresentDirView: UIView {
    
    //MARK: - create UI elements
    
    private let bigAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "New")
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var labelNamed: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 26)
        label.text = "Укажите ваше имя"
        label.clipsToBounds = true
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var labelEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 26)
        label.text = "Укажите вашу почту"
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var exitButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .cyan
        button.tintColor = .red
        button.setTitle("Выйти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 22)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    var labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 26)
        label.text = "Укажите доп. информацию"
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var labelDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 26)
        label.text = "Укажите дату рождения"
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    func actionForButton() {
        exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
    }
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsForLabelName() {
        labelNamed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelNamed.topAnchor.constraint(equalTo: self.topAnchor, constant: 330),
            labelNamed.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelNamed.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForBigAnimation() {
        bigAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigAnimationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            bigAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            bigAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            bigAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }

    func constraintsForLabelEmail() {
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    func constraintsForLabelInfo() {
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 470),
            labelInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    func constraintsForLabelDate() {
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 540),
            labelDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    func constraintsForExitButtone() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 700),
            exitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200),
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
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
    
    
    func setupAnimations() {
        bigAnimationView.loopMode = .loop
        bigAnimationView.play()
       
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLabelName()
        constraintsForLabelDate()
        constraintsForLabelInfo()
        constraintsForLabelEmail()
        constraintsImageView()
        constraintsForExitButtone()
        constraintsForBigAnimation()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(labelNamed)
        self.addSubview(labelEmail)
        self.addSubview(labelInfo)
        self.addSubview(labelDate)
        self.addSubview(exitButton)
        self.addSubview(bigAnimationView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        actionForButton()
        setupAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DataPresentDirView {
    @objc func exit() {
        onNextAction?()
    }
}
