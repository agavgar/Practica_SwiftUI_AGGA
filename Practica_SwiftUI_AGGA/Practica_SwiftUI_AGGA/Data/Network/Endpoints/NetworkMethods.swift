//
//  NetworkMethods.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 20/4/24.
//

import Foundation

enum NetworkErrors: Error {
    
    
}

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
    static let auth = "Authorization"
}

struct HTTPResponseCodes{
    static let SUCCES = 200
    static let NOT_AUTHORIZED = 401
    static let ERROR = 502
}

enum Endpoints: String {
    case login = "/auth/login"
    case heroes = "/heros/all"
    case transform = "/heros/tranformations"
}



