//
//  Network Errors.swift
//  WorkTracker
//
//  Created by Андрей Петров on 10.04.2024.
//

import Foundation

enum MyError: Error {
    case invalidUrl
    case invalidResponse
    case statusCode(Int)
    case noData
}

