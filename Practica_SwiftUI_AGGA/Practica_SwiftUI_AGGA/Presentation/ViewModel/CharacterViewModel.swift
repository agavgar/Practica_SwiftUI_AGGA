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
    func loadCharacters()
    func loadSeries(id: Int)
}

final class CharacterViewModel: CharacterViewModelProtocol, ObservableObject {
    
    @Published var characters = [Character]()
    @Published var series = [Series]()
    @Published var isLoading = false
    
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
    
    func loadCharacters(){
        isLoading = true
        print("cargando")
        Task{
            await getCharacter()
            DispatchQueue.main.async {
                self.isLoading = false
                print("dejo cargar")
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
    
    func loadSeries(id: Int) {
        isLoading = true
        //print("cargando")
        Task{
            await getSeries(id:id)
            DispatchQueue.main.async {
                self.isLoading = false
                //print("dejo cargar")
            }
        }
    }
    
    
}
