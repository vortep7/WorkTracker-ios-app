//
//  TableTimeForDir.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//
import UIKit

class TableTimeForDir: UITableViewCell {
    
    var reason: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var amount: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    var date: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    var kind: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .right 
        return label
    }()
    
    var imageViewMy: UIImageView = {
        let Image = UIImageView()
        Image.contentMode = .scaleAspectFit
        return Image
    }()
    
    func setupTableCell() {
        reason.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        kind.translatesAutoresizingMaskIntoConstraints = false
        imageViewMy.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(reason)
        contentView.addSubview(amount)
        contentView.addSubview(date)
        contentView.addSubview(kind)
        contentView.addSubview(imageViewMy)

        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true

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
            kind.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            imageViewMy.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            imageViewMy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageViewMy.widthAnchor.constraint(equalToConstant: 50),
            imageViewMy.heightAnchor.constraint(equalToConstant: 50)
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
