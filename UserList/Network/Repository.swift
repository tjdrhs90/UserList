//
//  Repository.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/17.
//

import Foundation

enum Repository {
    static func requestAPI<T: Codable>(path: ApiURL) async throws -> T {
        
        var components = URLComponents(string: ApiURL.baseURL.rawValue)
        
        components?.path = path.rawValue
        
        guard let url = components?.url else {
            throw MyError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw MyError.httpError
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}

enum MyError: Error {
    case urlError
    case httpError
}
//https://gyuios.tistory.com/180
