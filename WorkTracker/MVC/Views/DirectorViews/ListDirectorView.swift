//
//  ListDirectorView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class ListDirectorView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let buttonPerson: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        return button
    }()
    
    let buttonAddMyTasks: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        return button
    }()
    
    let reloadData: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        return button
    }()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.gray
        return toolbar
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        return tableView
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
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?
    var onPersonButton: (() -> Void)?
    var onMyTask: (() -> Void)?
    var onReloadData: (() -> Void)?

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
    
    func constraintForReloadData() {
        reloadData.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reloadData.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            reloadData.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            reloadData.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            reloadData.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func constraintForPersonButton() {
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPerson.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: 175),
            buttonPerson.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 25)
        ])
    }
    
    func constraintForButtonMyTask() {
        buttonAddMyTasks.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonAddMyTasks.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: -175),
            buttonAddMyTasks.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 25)
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
    
    func constraintsTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintForToolBar()
        constraintsTableView()
        constraintForPersonButton()
        constraintForButtonMyTask()
        constraintForReloadData()
    }
    
    //MARK: - setup action for buttons
    func actionForButton() {
        infoButton.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        buttonPerson.addTarget(self, action: #selector(newAction), for: .touchUpInside)
        buttonAddMyTasks.addTarget(self, action: #selector(myTaskAction), for: .touchUpInside)
        reloadData.addTarget(self, action: #selector(ReloadData), for: .touchUpInside)
    }
    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)
        self.addSubview(toolBar)
        self.addSubview(buttonPerson)
        self.addSubview(buttonAddMyTasks)
        self.addSubview(reloadData)
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

extension ListDirectorView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
    
    @objc func nextButtonAction() {
        onNextAction?()
    }
    
    @objc func newAction() {
        onPersonButton?()
    }
    
    @objc func myTaskAction() {
        onMyTask?()
    }
    
    @objc func ReloadData() {
        onReloadData?()
    }
}

extension ListDirectorView {
    func animationForButton(button: UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        button.alpha = 0.0
        UIView.animate(withDuration: 0.8, delay: 1.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            button.transform = .identity
            button.alpha = 1.0
        }, completion: nil)
    }
}
