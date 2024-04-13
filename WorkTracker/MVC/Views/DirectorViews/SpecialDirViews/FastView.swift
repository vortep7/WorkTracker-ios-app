//
//  FastView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation
import UIKit

class newViewForText: UIView {
    let titleLabel: UILabel
    let textField: UITextField
    let hoursTextField: UITextField
    let dateTextField: UITextField
    let confirmButton: UIButton
    var confirmAction: ((String) -> Void)?

    override init(frame: CGRect) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let width = screenWidth * 0.8
        let height: CGFloat = screenHeight / 4
        let x = (screenWidth - width) / 2
        let y: CGFloat = 0

        let frame = CGRect(x: x, y: y, width: width, height: height)

        titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: width - 20, height: 30))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)

        textField = UITextField(frame: CGRect(x: 20, y: 50, width: width - 20, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите задачу"
        
        hoursTextField = UITextField(frame: CGRect(x: 20, y: 90, width: width - 20, height: 30))
        hoursTextField.borderStyle = .roundedRect
        hoursTextField.placeholder = "Дедлайн: "
        
        dateTextField = UITextField(frame: CGRect(x: 20, y: 130, width: width - 20, height: 30))
        dateTextField.borderStyle = .roundedRect
        dateTextField.placeholder = "Введите кол. часов"

        confirmButton = UIButton(type: .system)
        confirmButton.frame = CGRect(x: 20, y: 160, width: width - 40, height: 40)
        confirmButton.setTitle("Подтвердить", for: .normal)
        super.init(frame: frame)
        confirmButton.addTarget(self, action: #selector(confirmAction(_:)), for: .touchUpInside)

        addSubview(titleLabel)
        addSubview(hoursTextField)
        addSubview(dateTextField)
        addSubview(textField)
        addSubview(confirmButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func confirmAction(_ sender: UIButton) {
        
        if let text = textField.text,
           let hoursText = hoursTextField.text,
           let dateText = dateTextField.text {
            let combinedText = "Задание: " + text + "." + " Дедлайн: " + hoursText + "." + " Необходимое кол-во часов:" + dateText + "."
            confirmAction?(combinedText)
        } else {
            print("error")
        }
    }
}
