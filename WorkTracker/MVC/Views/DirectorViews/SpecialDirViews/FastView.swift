//
//  FastView.swift
//  WorkTracker
//
//  Created by Андрей Петров on 09.04.2024.
//

import Foundation
import UIKit

class PopupView: UIView {
    let titleLabel: UILabel
    let textField: UITextField
    let confirmButton: UIButton
    var confirmAction: ((String) -> Void)?

    override init(frame: CGRect) {
        // Размеры и расположение окна
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let width = screenWidth * 0.8
        let height: CGFloat = screenHeight / 4 // 1/4 высоты экрана
        let x = (screenWidth - width) / 2
        let y: CGFloat = 0 // Верхняя часть экрана

        let frame = CGRect(x: x, y: y, width: width, height: height)

        // Инициализация элементов внутри окна
        titleLabel = UILabel(frame: CGRect(x: 20, y: 20, width: width - 40, height: 30))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)

        textField = UITextField(frame: CGRect(x: 20, y: 60, width: width - 40, height: 40))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите текст"

        confirmButton = UIButton(type: .system)
        confirmButton.frame = CGRect(x: 20, y: 120, width: width - 40, height: 40)
        confirmButton.setTitle("Подтвердить", for: .normal)
        super.init(frame: frame)
        confirmButton.addTarget(self, action: #selector(confirmAction(_:)), for: .touchUpInside)

        // Добавление элементов на окно
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(confirmButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func confirmAction(_ sender: UIButton) {
        // Вызываем замыкание confirmAction, передавая введенный текст
        confirmAction?(textField.text ?? "")
    }
}
