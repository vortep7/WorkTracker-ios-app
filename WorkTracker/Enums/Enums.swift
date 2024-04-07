//
//  Enums.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import Foundation

enum WordsForBluetoothState: String {
    case uniqe = "Уникальные названия Bluetooth устройств:"
    case search = "Найдено Bluetooth устройство "
    case end = "Сканирование завершено. Вывод уникальных названий Bluetooth устройств:"
    case start = "Bluetooth включен. Начинаю сканирование..."
    
    case normal = "Bluetooth выключен."
    case error = "Неизвестное состояние Bluetooth."
}
