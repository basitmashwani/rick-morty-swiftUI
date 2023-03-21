//
//  Character.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation

struct Character: Identifiable {
    let id = UUID()
    let characterId: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let imgURL: String
    let lastLocation: String
    let episodeCount: Int
}

extension Character {
    static var mock: Character {
        Character(
            characterId: 0,
            name: "Ricky",
            status: "Alive",
            species: "Human",
            gender: "Male",
            imgURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            lastLocation: "Earth",
            episodeCount: 3
        )
    }
}
