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

enum EndpointsKC: String{
    case url = "https://dragonball.keepcoding.education/api"
    case login = "/auth/login"
}

enum EndpointsMarvel: String {
    case url = "https://gateway.marvel.com/"
    case characters = "v1/public/characters"
    case publicKey = "17bf6269b1c110b54464c4975cd7846b"
    case privateKey = "07b5d02faf41c1fb96db440fe4689b07f82f4d47"
    //case comics = "/v1/public/comics"
    case timestamp = "?ts="
    case apiKey = "?apikey="
    case hash = "&hash="
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
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let application = "application/json"
    static let content = "Content-type"
    static let auth = "Authorization"
    static let apikey = "Apikey"
    static let timestamp = "ts"
    static let hash = "hash"
}
