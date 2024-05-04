//
//  Protocols.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation

protocol CharacterRepositoryProtocol{
    func getCharacters() async -> [Character]?
    func getSeries(id:Int) async -> [Series]?
}
