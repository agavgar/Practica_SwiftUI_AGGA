//
//  CharacterViewModel.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation
import SwiftUI

protocol CharacterViewModelProtocol {
    var repo: CharacterRepositoryProtocol { get set }
    func getCharacter() async
}

final class CharacterViewModel: CharacterViewModelProtocol {
    @State var characters = [Character]()
    var repo: CharacterRepositoryProtocol
    
    init(repo: CharacterRepositoryProtocol = CharacterRepository(Network: CharacterNetwork())) {
        self.repo = repo
    }
    
    func getCharacter() async {
        let data = await repo.getCharacters()
        
        if data != nil{
            DispatchQueue.main.async {
                self.characters = data!
            }
        }
        
    }
    
}
