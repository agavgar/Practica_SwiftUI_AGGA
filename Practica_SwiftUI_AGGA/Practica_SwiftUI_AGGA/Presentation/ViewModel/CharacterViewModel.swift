//
//  CharacterViewModel.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation
import SwiftUI
import Combine

protocol CharacterViewModelProtocol {
    var repo: CharacterRepositoryProtocol { get set }
    func getCharacter() async
    func getSeries(id: Int) async
    func loadCharacters()
    func loadSeries(id: Int)
}

final class CharacterViewModel: CharacterViewModelProtocol {
    
    @Published var characters = [Character]()
    @Published var series = [Series]()
    
    var repo: CharacterRepositoryProtocol
    
    init(repo: CharacterRepositoryProtocol = CharacterRepository(Network: CharacterNetwork())) {
        self.repo = repo
        loadCharacters()
    }
    
    func getCharacter() async {
        let data = await repo.getCharacters()
        
        if data != nil{
            DispatchQueue.main.async {
                self.characters = data!
            }
        }
        
    }
    
    func loadCharacters(){
        Task{
            await getCharacter()
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
    
    func loadSeries(id: Int) {
        Task{
            await getSeries(id:id)
        }
    }
    
    
}

extension CharacterViewModel: ObservableObject {}
