//
//  MockCharacterData.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import Foundation

@testable import Rick_Morty_App

struct MockCharacterData {
    enum ResponseType {
        case success, failure
    }
    struct FakeError: Error {}
    static let characterData = [Character(characterId: 1, name: "Rick Sanchez",
                                          status: "Alive", species: "Human", gender: "Male", imgURL: "",
                                          lastLocation: "Citadel of Ricks", episodeCount: 50),
                                Character(characterId: 2, name: "Morty Smity",
                                          status: "Alive", species: "Human", gender: "Male", imgURL: "",
                                          lastLocation: "Citadel of Ricks", episodeCount: 50),
                                Character(characterId: 3, name: "Summer Smith",
                                          status: "Alive", species: "Human", gender: "Female", imgURL: "",
                                          lastLocation: "Citadel of Ricks", episodeCount: 50),
                                Character(characterId: 4, name: "Beth Smith",
                                          status: "Alive", species: "Human", gender: "Female", imgURL: "",
                                          lastLocation: "Earth (Replacement Dimension)", episodeCount: 120),
                                Character(characterId: 5, name: "Jery Smith",
                                          status: "Alive", species: "Human", gender: "Male", imgURL: "",
                                          lastLocation: "Citadel of Ricks", episodeCount: 90)]
}
