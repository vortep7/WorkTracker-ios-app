//
//  InfoWorkerView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import UIKit

final class InfoWorkerView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thirdFon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Vetrino", size: 18)
        label.textColor = .white
        return label
    }()
    
    var labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.text = "Total spent time:"
        return label
    }()
    
    var labelBig: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.text = "Current group:"
        return label
    }()
    
    var button:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .firstColor
        button.tintColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Update", for: .normal)
        button.titleLabel?.font = UIFont(name: "Vetrino", size: 13)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .white
        return tableView
    }()
    
    
    //MARK: - clousers for buttons action
    var onNumberAction: (() -> Void)?
    var onNextAction: (() -> Void)?

    //MARK: - constraints
    
    func constraintsbutton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -750),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 310),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func constraintsBigLabel() {
        labelBig.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelBig.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            labelBig.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -730),
            labelBig.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelBig.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
        ])
    }
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -630),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
        ])
    }
    
    func constraintsForLabelInfo() {
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            labelInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -660),
            labelInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
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
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func actionForButton() {
        button.addTarget(self, action: #selector(logButtonAction), for: .touchUpInside)
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsTableView()
        constraintsbutton()
        constraintsForLabel()
        constraintsForLabelInfo()
        constraintsBigLabel()
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)
        self.addSubview(button)
        self.addSubview(label)
        self.addSubview(labelInfo)
        self.addSubview(labelBig)
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


extension InfoWorkerView {
    @objc func logButtonAction() {
        onNumberAction?()
    }
}
