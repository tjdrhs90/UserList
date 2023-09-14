//
//  Extension.swift
//  UserList
//
//  Created by 심성곤 on 2023/08/18.
//

import Foundation

extension Encodable {
    var printJson: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self),
              let output = String(data: data, encoding: .utf8) else { return "" }
        return output
    }
}
