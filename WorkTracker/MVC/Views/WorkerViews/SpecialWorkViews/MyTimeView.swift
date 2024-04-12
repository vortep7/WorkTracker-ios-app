//
//  MyTimeView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 12.04.2024.
//

import Foundation
import UIKit
import Lottie

final class MyTimeView: UIView {
    
    //MARK: - create UI elements
    private let bigAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "New")
//        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fourthFon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Время работы (проценты): "
        return label
    }()
    
    var hoursLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 65, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Hours Worked: 0"
        return label
    }()
    
    //MARK: - constraints
    
    func constraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func constraintsBigLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20)
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
    
    func constraintsHoursLabel() {
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hoursLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hoursLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50)
        ])
    }
    
    func setupAnimations() {
        bigAnimationView.loopMode = .loop
        bigAnimationView.play()
       
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsHoursLabel()
        constraintsForBigAnimation()
        constraintsBigLabel()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(hoursLabel)
        self.addSubview(bigAnimationView)
        self.addSubview(titleLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        setupAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
