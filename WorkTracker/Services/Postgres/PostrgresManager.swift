//
//  PostrgresManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 11.04.2024.
//
import Foundation
import PostgresClientKit

class PostrgresManager {
    
    static let shared = PostrgresManager()
    private init() {}
    
    //MARK: - for ML tool 
    func fetchAllData() {
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "::1"
            configuration.database = "test"
            configuration.user = "postgres"
            configuration.credential = .scramSHA256(password: "1234")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
                        
            let text = "SELECT * FROM workers;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            print("первый принт")
            
            let result = try statement.execute()
            defer { result.close() }
            print("второй  принт")
            print(result)
        } catch {
            print("Error: \(error)")
        }
    }
    
    
}

