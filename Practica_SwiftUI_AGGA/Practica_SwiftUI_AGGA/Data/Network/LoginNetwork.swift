//
//  APIProvider.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation
import CryptoKit

protocol LoginNetworkProtocol{
    func login(user: String, password: String) async -> Void
}

final class LoginNetwork: LoginNetworkProtocol {
    
    private let secureData: SecureDataProtocol
    
    init(secureData: SecureDataProtocol = SecureData()) {
        self.secureData = secureData
    }
    
    func login(user: String, password: String) async {
        
        var token = ""
        let url = URL(string: "\(EndpointsKC.url.rawValue)\(EndpointsKC.login.rawValue)")
        
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var segCredentials = ""
        if var segCredentials = encodeCredentials {
            segCredentials = "Basic \(segCredentials)"
        }
        
        var request: URLRequest = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.application, forHTTPHeaderField: HTTPMethods.content)
        request.addValue(segCredentials, forHTTPHeaderField: HTTPMethods.auth)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == HTTPResponseCodes.SUCCES{
                    token = String(decoding: data, as: UTF8.self)
                    secureData.setMToken(token: token)
                }else{
                    print(String(describing: NetworkErrors.statusCode(code: response.statusCode)))
                }
            }
        }catch{
            print(String(describing: NetworkErrors.tokenNotFound))
        }
    }
    
    
}

final class LoginNetworkFake: LoginNetworkProtocol{
    func login(user: String, password: String) async {
        print("Succed")
    }
    
}
