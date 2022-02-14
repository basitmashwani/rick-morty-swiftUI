//
//  CharacterDTO.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
struct CharactersDTO: Codable {
    let characters: [CharacterDTO]
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct CharacterDTO: Codable {
    let characterId: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let imgURL: String
    let location: Location
    let episodes: [String]
    enum CodingKeys: String, CodingKey {
        case characterId = "id"
        case episodes = "episode"
        case imgURL = "image"
        case name, status, species, gender, location
    }
}

struct Location: Codable {
    let name: String
    let url: String
}

// MARK: - Extension
extension CharacterDTO {
    /// Method that changes the DTO to Domain Model
    /// - Returns: Character Domain Model
    func toDomain() -> Character {
        .init(characterId: characterId, name: name, status: status, species: species,
              gender: gender, imgURL: imgURL, lastLocation: location.name,
              episodeCount: episodes.count)
    }
}
