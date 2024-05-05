//
//  HTTPMethods.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation

enum NetworkErrors: Error {
    case malformedURL
    case statusCode(code:Int?)
    case failDecodingData
    case noData
    case tokenNotFound
    case unknown
}

enum EndpointsMarvel: String {
    case url = "https://gateway.marvel.com"
    case characters = "/v1/public/characters"
    case EndSerie = "/series"
    case apiKey = "?apikey=f807897efc1c14631fa63ca95be6d339"
    case timestamp = "&ts=7"
    case hash = "&hash=bf3a96859b41804bd73135d340014e14"
}

struct HTTPResponseCodes{
    static let SUCCES = 200
    static let MISSING_API_KEY_HASH_TIMESTAMP = 409
    static let INVALID_REFERER_HASH = 401
    static let MISSING_API_KEY = 409
    static let METHOD_NOT_ALLOWED = 405
    static let FORBIDDEN = 403
}
struct HTTPMethods {
    static let get = "GET"
    static let content = "application/json"
    static let type = "Content-type"
}
