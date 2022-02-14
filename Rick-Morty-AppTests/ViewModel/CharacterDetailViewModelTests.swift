//
//  CharacterDetailViewModelTests.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import XCTest
@testable import Rick_Morty_App

class CharacterDetailViewModelTests: XCTestCase {
    let mockCharacter = Character(characterId: 1, name: "Rick Sanchez",
                              status: "Alive", species: "Human", gender: "Male", imgURL: "",
                              lastLocation: "Citadel of Ricks", episodeCount: 50)

    func test_characterDetail_name_is_Valid() {
        let viewModel = CharacterDetailViewModel(character: mockCharacter)
        XCTAssertEqual(viewModel.name, "Rick Sanchez")
    }
    func test_characterDetail_status_is_Valid() {
        let viewModel = CharacterDetailViewModel(character: mockCharacter)
        XCTAssertEqual(viewModel.status, "Alive")
    }
    func test_characterDetail_species_is_Valid() {
        let viewModel = CharacterDetailViewModel(character: mockCharacter)
        XCTAssertEqual(viewModel.species, "Human")
    }
    func test_characterDetail_gender_is_Valid() {
        let viewModel = CharacterDetailViewModel(character: mockCharacter)
        XCTAssertEqual(viewModel.gender, "Male")
    }
}
