//
//  InfoTimeView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import UIKit
import Foundation

final class InfoTimeView: UIView {
    
    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.contentMode = .scaleAspectFill
        return imageView
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


    //MARK: - setup all constraints
    func createConstraints() {
        constraintsImageView()
        constraintsTableView()
        animateLabel()

    }
    
    func animateLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36)
        label.text = "Задачи для сотрудников"
        label.center = CGPoint(x: self.bounds.midX, y: self.bounds.height * 0.25 - 100)
        self.addSubview(label)
        
        UIView.animate(withDuration: 1.0, animations: {
            label.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
                label.alpha = 0.0
            }, completion: { (_) in
                label.removeFromSuperview()
            })
        }
    }
        
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(tableView)

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



