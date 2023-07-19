//
//  User.swift
//  StoreApp
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var password: String
    var name: String
    var role: String
    var avatar: String
}
struct UserResponse: Codable {
    var email: String
    var password: String
    var name: String
    var avatar: String
    var role: String
    var id: Int
//    enum CodingKeys: String, CodingKey {
//        case email = "email", password = "password", name = "name", avatar = "avatar", role = "role", id = "id"
//    }
}
struct UserRegisterEntity: Codable {
    var name: String
    var email: String
    var password: String
    var avatar: String
}
struct changeUser: Codable {
    var name: String
    var email: String
}
struct Userprueba: Codable {
    var name: String
    var job: String
    var id: String
    var createdAt: String
}
struct userpruebaresponse: Codable {
    var name: String
    var job: String
}
struct userReponsesPost:Codable {
    var email: String
    var password: String
    var name: String
    var avatar: String
    var role: String
    var id: Int
    var creationAt: String
    var updatedAt: String
}
