//
//  DirectorTasksColl.swift
//  WorkTracker
//
//  Created by Андрей Петров on 10.04.2024.
//
import UIKit
import Foundation

class DirectorTaskCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Cell
    
    private func setupCell() {
        contentView.addSubview(taskLabel)
        contentView.addSubview(taskImageView)
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            taskImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            taskImageView.widthAnchor.constraint(equalToConstant: 50),
            taskImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
