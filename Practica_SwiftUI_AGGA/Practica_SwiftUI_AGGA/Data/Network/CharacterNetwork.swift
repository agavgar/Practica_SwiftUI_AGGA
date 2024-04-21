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
}

final class CharacterNetwork: CharacterNetworkProtocol {
    
    private let secureData: SecureDataProtocol
    
    init(secureData: SecureDataProtocol = SecureData()) {
        self.secureData = secureData
    }
    
    func getCharacters() async -> [Character]? {
        var characters = [Character]()
        var url = URL(string: "")
        // Creamos los 3 parámetros que necesitamos para enviarlos
        var hash = secureData.getMToken()
        let dateString = DateFormatter()
        let ts = dateString.string(from: Date.now)
        let apiKey = EndpointsMarvel.publicKey.rawValue
        //Comprobamos que hash no lo tengamos creado
        if hash == hash {
            url = URL(string: "\(EndpointsMarvel.url.rawValue)\(EndpointsMarvel.timestamp.rawValue)\(dateString)\(EndpointsMarvel.apiKey.rawValue)\(apiKey)\(EndpointsMarvel.hash)\(hash)")
        }else{
            hash = md5(timestamp: ts, publicKey: EndpointsMarvel.publicKey.rawValue, privateKey: EndpointsMarvel.privateKey.rawValue)
            if let hash = hash {
                secureData.setMToken(token: hash)
                url = URL(string: "\(EndpointsMarvel.url.rawValue)\(EndpointsMarvel.timestamp.rawValue)\(dateString)\(EndpointsMarvel.apiKey.rawValue)\(apiKey)\(EndpointsMarvel.hash)\(hash)")
            }else{
                print("APIPROVIDER ERROR MD5 HASH")
                hash = ""
            }
            
        }
        
        print(url!)
        
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        request.addValue("17bf6269b1c110b54464c4975cd7846b", forHTTPHeaderField:HTTPMethods.apikey)
        request.addValue(ts, forHTTPHeaderField: HTTPMethods.timestamp)
        request.addValue(hash!, forHTTPHeaderField: HTTPMethods.hash)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == HTTPResponseCodes.SUCCES{
                    characters = try JSONDecoder().decode([Character].self, from: data)
                }else{
                    print(String(describing: NetworkErrors.statusCode(code: response.statusCode)))
                }
            }
        }catch{
            print(String(describing: NetworkErrors.tokenNotFound))
            characters = []
        }
        
        return characters
    }
    
    func md5(timestamp: String, publicKey: String, privateKey: String) -> String {
        let stringData = timestamp+publicKey+privateKey
        let hashData = stringData.data(using: .utf8)
        if let hashData = hashData{
            let hashEncoder = SHA256.hash(data: hashData)
            let hashString = hashEncoder.compactMap { String(format: "%02x", $0) }.joined()
            print(hashString)
            return hashString
        }else{
            print("APIPROVIDER ERROR MD5 HASH")
            return "Error md5Function"
        }
    }
    
    
}

final class CharacterNetworkFake: CharacterNetworkProtocol{
    
    func getCharacters() async -> [Character]? {
        let model1 = Character(id: 1, name: "Spider Man", description: "Ola k Ase", modified: Date.now, thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
        let model2 = Character(id: 2, name: "THOR", description: "SI VEO POLICIA HAGO SANTA CLAUS", modified: Date.now, thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
        let characters = [model1, model2]
        return characters
    }
    
    
}
