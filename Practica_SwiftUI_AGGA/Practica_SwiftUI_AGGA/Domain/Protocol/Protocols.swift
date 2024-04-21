//
//  Protocols.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation

protocol LoginRepositoryProtocol{
    func login(user: String, password: String) async -> Void
}

protocol CharacterRepositoryProtocol{
    func getCharacters() async -> [Character]?
}
