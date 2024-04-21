//
//  LoginRepository.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//

import Foundation

//MARK: - Real Login Repository
final class LoginRepository: LoginRepositoryProtocol {
    
    private var network: LoginNetworkProtocol
    
    init(Network: LoginNetworkProtocol = LoginNetwork()) {
        self.network = Network
    }
    
    func login(user: String, password: String) async {
        await network.login(user: user, password: password)
    }
    
}

//MARK: - Fake Login Repository
final class LoginRepositoryFake: LoginRepositoryProtocol {
    
    private var network: LoginNetworkProtocol
    
    init(Network: LoginNetworkProtocol = LoginNetworkFake()) {
        self.network = Network
    }
    
    func login(user: String, password: String) async {
        await network.login(user: user, password: password)
    }
    
}
