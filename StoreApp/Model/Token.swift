//
//  Token.swift
//  StoreApp
//

import Foundation

struct token: Codable{
    var access_token: String
    var refresh_token: String
    enum CodingKeys: String, CodingKey {
        case access_token = "access_token", refresh_token = "refresh_token"
    }
}
