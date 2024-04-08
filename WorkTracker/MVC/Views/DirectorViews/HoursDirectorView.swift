//
//  HoursDirectorView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class HoursDirectorView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let toolBar: UIToolbar = {
            let toolbar = UIToolbar()
            toolbar.backgroundColor = UIColor.gray
            return toolbar
        }()
    
    private let firstTextView:UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = TextForTextViews.firstTextView.rawValue
        
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.layer.cornerRadius = 15
        return textView
    }()
    
    private let secondTextView:UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 12
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = TextForTextViews.secondTexView.rawValue
        
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.layer.cornerRadius = 15
        return textView
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
       
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 30)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    private let justView: UIView = {
        let rectangleView = UIView()
        rectangleView.backgroundColor = .white
        rectangleView.layer.cornerRadius = 10
        rectangleView.layer.masksToBounds = true
        
        return rectangleView
    }()
    
    var labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 18)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.text = "Количество времени на работе: "
        label.layer.shadowOpacity = 1.0
        return label
    }()
    
    var labelNamed: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 30)
        label.textColor = .red
        label.text = "Добро пожаловать!"
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
    
    func constraintForToolBar() {
            toolBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                toolBar.topAnchor.constraint(equalTo: self.topAnchor),
                toolBar.heightAnchor.constraint(equalToConstant: 95)
            ])
        }
        
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForRectangle() {
        justView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            justView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -200),
            justView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 200),
            justView.widthAnchor.constraint(equalToConstant: 200),
            justView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    

    func constraintsForLabelNamed() {
        labelNamed.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelNamed.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            labelNamed.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -730),
            labelNamed.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            labelNamed.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForFirstTextView() {
        firstTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 350),
            firstTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -340),
            firstTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 220),
            firstTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    func constraintsForSecondTextView() {
        secondTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 570),
            secondTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -130),
            secondTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            secondTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -210)
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
    
    
    func constraintsForNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 550),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForLabelInfo() {
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInfo.bottomAnchor.constraint(equalTo: label.topAnchor, constant: 15),
            labelInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            labelInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func addLabelOnView() {
        self.addSubview(labelNamed)
        labelNamed.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                self.labelNamed.alpha = 1
            }, completion: nil)
        }
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForLabel()
        constraintsImageView()
        constraintsForLabelNamed()
        constraintsForFirstTextView()
        constraintsForLabelInfo()
        constraintsForSecondTextView()
        constraintForToolBar()
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        addLabelOnView()
        self.addSubview(label)
        self.addSubview(firstTextView)
        self.addSubview(secondTextView)
        self.addSubview(labelInfo)
        self.addSubview(toolBar)
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

//enum TextForTextViews:String  {
//    case firstTextView = "Текущая диаграмма. Красным - количество неотработанных часов. Зеленым - отработоннах."
//    case secondTexView = "Еженедельная сводка по количеству отработанных часов.Максимальная планка - 40"
//}
