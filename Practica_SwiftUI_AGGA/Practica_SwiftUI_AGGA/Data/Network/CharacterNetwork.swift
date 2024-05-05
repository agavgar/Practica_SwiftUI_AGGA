//
//  APIProvider.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation
import CryptoKit

protocol CharacterNetworkProtocol{
    func getCharacters() async -> [Character]?
    func getSeries(id: Int) async -> [Series]?
}

final class CharacterNetwork: CharacterNetworkProtocol {
    
    func getCharacters() async -> [Character]? {
        var character = [Character]()
        let url = URL(string: "\(EndpointsMarvel.url.rawValue)\(EndpointsMarvel.characters.rawValue)\(EndpointsMarvel.apiKey.rawValue)\(EndpointsMarvel.timestamp.rawValue)\(EndpointsMarvel.hash.rawValue)")
        
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: HTTPMethods.type)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == HTTPResponseCodes.SUCCES{
                    let parent = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
                    character = parent.data.results
                }else{
                    print(String(describing: NetworkErrors.statusCode(code: response.statusCode)))
                }
            }
        }catch{
            character = []
        }
        
        return character
    }
    
    func getSeries(id: Int) async -> [Series]? {
        var series = [Series]()
        let url = URL(string: "\(EndpointsMarvel.url.rawValue)\(EndpointsMarvel.characters.rawValue)/\( id)\(EndpointsMarvel.EndSerie.rawValue)\(EndpointsMarvel.apiKey.rawValue)\(EndpointsMarvel.timestamp.rawValue)\(EndpointsMarvel.hash.rawValue)")
        
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: HTTPMethods.type)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == HTTPResponseCodes.SUCCES{
                    let parent = try JSONDecoder().decode(SeriesDataWrapper.self, from: data)
                    series = parent.data.results
                }else{
                    print(String(describing: NetworkErrors.statusCode(code: response.statusCode)))
                }
            }
        }catch{
            series = []
        }
        
        return series
    }
    
    
    
}

final class CharacterNetworkFake: CharacterNetworkProtocol{
    
    func getCharacters() async -> [Character]? {
        return []
    }
    
    func getSeries(id: Int) -> [Series]? {
        return []
    }
    
    
}
