//
//  Service.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/17.
//

import Foundation

enum Service {
    static func fetchUsers() async throws -> [User] {
        try await Repository.requestAPI(path: .users)
    }
}
