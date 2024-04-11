//
//  GetTaskTable.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation
import UIKit

class GetTaskTable: UITableViewCell {
    
    var reason: UILabel = {
        let reason = UILabel()
        reason.textColor = .black
        reason.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        reason.numberOfLines = 0
        return reason
    }()
    
    var amount: UILabel = {
        let amount = UILabel()
        amount.textColor = UIColor(red: 0.22, green: 0.67, blue: 0.34, alpha: 1.0) // Зеленый цвет для количества
        amount.font = UIFont.systemFont(ofSize: 14, weight: .semibold) // Жирный шрифт
        return amount
    }()
    
    var date: UILabel = {
        let date = UILabel()
        date.textColor = .gray // Серый цвет для даты
        date.font = UIFont.italicSystemFont(ofSize: 14) // Курсивный шрифт для даты
        return date
    }()
    
    var kind: UILabel = {
        let kind = UILabel()
        kind.textColor = .darkGray // Темно-серый цвет для типа
        kind.font = UIFont.systemFont(ofSize: 14) // Обычный шрифт для типа
        kind.numberOfLines = 0
        return kind
    }()
    
    func setupTableCell() {
        contentView.backgroundColor = .white // Белый фон ячейки
        
        contentView.layer.cornerRadius = 15 // Скругление углов
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4
        
        reason.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        kind.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(reason)
        contentView.addSubview(amount)
        contentView.addSubview(date)
        contentView.addSubview(kind)

        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            reason.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reason.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            amount.topAnchor.constraint(equalTo: reason.bottomAnchor, constant: 8),
            amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            date.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: 4),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            kind.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 4),
            kind.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            kind.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            kind.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)])
        
        // Добавим анимацию изменения цвета фона при выборе ячейки
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0) // Цвет выделения
        selectedBackgroundView = selectedView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
