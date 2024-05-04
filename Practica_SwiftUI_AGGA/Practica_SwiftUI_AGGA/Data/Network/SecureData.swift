//
//  SecureData.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//
/*
import Foundation
import KeychainSwift

protocol SecureDataProtocol {
    func setMToken(token:String)
    func getMToken() -> String?
    func deleteMToken()
}

final class SecureData: SecureDataProtocol {

    private let keychain = KeychainSwift()
    private let MKey = "MarvelKey"
    
    func setMToken(token: String) {
        keychain.set(token, forKey: MKey)

    }
    
    func getMToken() -> String? {
        return keychain.get(MKey)

    }
    
    func deleteMToken() {
        keychain.delete(MKey)
    }
    
    
    
}
*/
