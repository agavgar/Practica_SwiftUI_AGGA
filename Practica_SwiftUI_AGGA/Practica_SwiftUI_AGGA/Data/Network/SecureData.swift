//
//  SecureData.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation
import KeychainSwift

protocol SecureDataProtocol {
    func setKCToken(token:String)
    func getKCToken() -> String?
    func deleteKCToken()
    func setMToken(token:String)
    func getMToken() -> String?
    func deleteMToken()
}

final class SecureData: SecureDataProtocol {

    private let keychain = KeychainSwift()
    private let KCToken = "KCToken"
    private let MKey = "MarvelKey"
    
    func setKCToken(token: String) {
        keychain.set(token, forKey: KCToken)
    }
    
    func getKCToken() -> String? {
        return keychain.get(KCToken)
    }
    
    func deleteKCToken() {
        keychain.delete(KCToken)
    }
    
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
