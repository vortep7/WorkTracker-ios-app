//
//  InfoDirectorTable.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Foundation
import UIKit

class InfoDirectorTable: UITableViewCell {
    
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
    
    var imageViewMy: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setupTableCell() {
        reason.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        kind.translatesAutoresizingMaskIntoConstraints = false
        imageViewMy.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(imageViewMy)
        self.contentView.addSubview(reason)
        self.contentView.addSubview(amount)
        self.contentView.addSubview(date)
        self.contentView.addSubview(kind)

        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            reason.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            reason.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -40),
            reason.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            amount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            amount.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            amount.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8),
            
            date.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 14),
            date.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            date.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8),
            
            imageViewMy.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 14),
            imageViewMy.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 200),
            imageViewMy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageViewMy.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -40),
        
            kind.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 1),
            kind.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 170),
            kind.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            kind.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8)])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
