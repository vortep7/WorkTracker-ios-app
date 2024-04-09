//
//  TableTimeForDir.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//
import UIKit

class TableTimeForDir: UITableViewCell {
    
    var reason: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    var amount: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    var date: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        return reason
    }()
    
    var kind: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        reason.numberOfLines = 2
        return reason
    }()
    
    func setupTableCell() {
        reason.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        kind.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(reason)
        contentView.addSubview(amount)
        contentView.addSubview(date)
        contentView.addSubview(kind)

        // Добавление декоративных элементов
        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true
        
        // Отступы между элементами
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            reason.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            reason.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            amount.topAnchor.constraint(equalTo: reason.bottomAnchor, constant: padding),
            amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            date.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: padding),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            kind.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            kind.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: padding),
            kind.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            kind.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
