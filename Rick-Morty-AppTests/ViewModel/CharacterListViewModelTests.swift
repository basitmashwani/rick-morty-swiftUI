//
//  CharacterListViewModelTests.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import XCTest
@testable import Rick_Morty_App

class CharacterListViewModelTest: XCTestCase {
    static let mockCharacters = [Character(characterId: 1, name: "Rick Sanchez",
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

    func test_search_valid_character() {
        let useCaseMock = MockCharacterUseCase()
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        // when
        viewModel.fetchCharacters()
        
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 2.0)

       let items = viewModel.filter(by: .constant("Morty Smity"))
        // then
        XCTAssertEqual(items.count, 1)
    }

    func test_search_invalid_character() {
        let useCaseMock = MockCharacterUseCase()
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        // when
        viewModel.fetchCharacters()
        
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 2.0)
        let items = viewModel.filter(by: .constant("Smity198"))
        // then
        XCTAssertEqual(items.count, 0)
    }
}
