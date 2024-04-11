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
    
    func fetchData() {        
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "127.0.0.1"
            configuration.database = "example"
            configuration.user = "bob"
            configuration.credential = .scramSHA256(password: "welcome1")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT city, temp_lo, temp_hi, prcp, date FROM weather WHERE city = $1;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: [ "San Francisco" ])
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                let city = try columns[0].string()
                let tempLo = try columns[1].int()
                let tempHi = try columns[2].int()
                let prcp = try columns[3].optionalDouble()
                let date = try columns[4].date()
                
                print("""
                    \(city) on \(date): low: \(tempLo), high: \(tempHi), \
                    precipitation: \(String(describing: prcp))
                    """)
            }
        } catch {
            print(error)
        }
    }
}

