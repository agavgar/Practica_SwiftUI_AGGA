//
//  MarvelModels.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 21/4/24.
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

//MARK: - CharacterDataWrapper
struct CharacterDataWrapper: Codable {
    let data: CharacterDataContainer
}

//MARK: - CharacterDataContainer
struct CharacterDataContainer: Codable {
    let results: [Character]
}

// MARK: - Characters
struct Character: Codable, Identifiable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
}

//MARK: - SeriesDataWrapper
struct SeriesDataWrapper: Codable {
    let data: SeriesDataContainer
}
//MARK: - SeriesDataContainer
struct SeriesDataContainer: Codable {
    let results: [Series]
}

//MARK: - Series
struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail
}



