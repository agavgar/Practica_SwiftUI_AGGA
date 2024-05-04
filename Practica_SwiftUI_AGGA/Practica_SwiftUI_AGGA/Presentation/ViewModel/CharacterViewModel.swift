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
    func getSeries(id: Int) async
}

final class CharacterViewModel: CharacterViewModelProtocol {
    
    @State var characters = [Character]()
    @State var series = [Series]()
    
    var repo: CharacterRepositoryProtocol
    
    init(repo: CharacterRepositoryProtocol = CharacterRepository(Network: CharacterNetwork())) async {
        self.repo = repo
        await getCharacter()
    }
    
    func getCharacter() async {
        let data = await repo.getCharacters()
        
        if data != nil{
            DispatchQueue.main.async {
                self.characters = data!
            }
        }
        
    }
    
    func getSeries(id: Int) async {
        let data = await repo.getSeries(id: id)
        
        if data != nil{
            DispatchQueue.main.async {
                self.series = data!
            }
        }
    }
    
    
}

extension CharacterViewModel: ObservableObject {}
