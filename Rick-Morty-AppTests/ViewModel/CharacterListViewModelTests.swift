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

    func testViewDidLoad_whenCharactersAreSuccessfullyLoaded_shouldHaveLoadedViewState() {
        // given
        var currentState: CharacterListViewState?
        let useCaseMock = MockCharacterUseCase()
        useCaseMock.resultLoadCharacters = .success(Self.mockCharacters)
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        viewModel.viewStateUpdated = {
            currentState = $0
        }
        // when
        viewModel.viewDidLoad()
        // then
        XCTAssertEqual(currentState, .loaded)
    }

    func testViewDidLoad_whenCharacterAreFailedToLoad_shouldHaveFailedViewState() {
        // given
        var currentState: CharacterListViewState?
        let useCaseMock = MockCharacterUseCase()
        useCaseMock.resultLoadCharacters = .failure(RickMortyError.apiError)
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        viewModel.viewStateUpdated = {
            currentState = $0
        }
        // when
        viewModel.viewDidLoad()
        // then
        XCTAssertEqual(currentState, .failed("Ops Something went wrong. Please try later!"))
    }

    func test_search_valid_character() {
        let useCaseMock = MockCharacterUseCase()
        useCaseMock.resultLoadCharacters = .success(Self.mockCharacters)
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        // when
        viewModel.viewDidLoad()
        viewModel.filter(by: "Morty Smity")
        // then
        XCTAssertEqual(viewModel.numberOfRows, 1)
    }

    func test_search_invalid_character() {
        let useCaseMock = MockCharacterUseCase()
        useCaseMock.resultLoadCharacters = .success(Self.mockCharacters)
        let viewModel = CharacterListViewModel(useCase: useCaseMock)
        // when
        viewModel.viewDidLoad()
        viewModel.filter(by: "Smity198")
        // then
        XCTAssertEqual(viewModel.numberOfRows, 0)
    }
}
