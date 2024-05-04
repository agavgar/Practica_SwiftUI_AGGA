//
//  CharacterRepository.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation

final class CharacterRepository: CharacterRepositoryProtocol {

    private var network: CharacterNetworkProtocol
    
    init(Network: CharacterNetworkProtocol = CharacterNetwork()) {
        self.network = Network
    }
    
    func getCharacters() async -> [Character]? {
        return await network.getCharacters()
    }
    
    func getSeries(id: String) async -> [Series]? {
        return await network.getSeries(id: id)
    }
    

}

final class CharacterRepositoryFake: CharacterRepositoryProtocol {
    
    private var network: CharacterNetworkProtocol
    
    init(Network: CharacterNetworkProtocol = CharacterNetworkFake()) {
        self.network = Network
    }
    
    func getCharacters() async -> [Character]? {
        return await network.getCharacters()
    }
    
    func getSeries(id: String) async -> [Series]? {
        return await network.getSeries(id: id)
    }

}
