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
        return reason
    }()
    
    func setupTableCell() {
        reason.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(reason)
    
        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            reason.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 18),
            reason.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -40),
            reason.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
