//
//  NetworkManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 10.04.2024.
//

import Foundation
class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let decoder = JSONDecoder()
    
    func createUrl() -> URL? {
        let urlString = "http://31.129.57.219/docs#"
        return URL(string: urlString)
    }
    
    func fetchData(completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = createUrl() else {
            completion(.failure(MyError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = MyError.invalidResponse
                print("Response error: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Response data is nil")
                let error = MyError.noData
                completion(.failure(error))
                return
            }
            
            do {
                let items = try self.decoder.decode([Item].self, from: data)
                completion(.success(items))
            } catch {
                print("JSON decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}

struct Item: Decodable {
    var name: String
    var description: String
    var id: Int
}

enum MyError: Error {
    case invalidUrl
    case invalidResponse
    case statusCode(Int)
    case noData
}

