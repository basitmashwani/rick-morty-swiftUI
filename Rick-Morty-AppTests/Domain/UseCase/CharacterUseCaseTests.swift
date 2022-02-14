//
//  CharacterUseCaseTests.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import XCTest
@testable import Rick_Morty_App

class CharacterUseCaseTests: XCTestCase {
    func testLoadCharacters_whenSuccessfullyFetchesCharacter_shouldHaveCharacters() {
        // given
        let mockCharacterRepository = MockCharacterRepository()
        mockCharacterRepository.resultLoadCharacters = .success(MockCharacterData.characterData)
        let useCase = CharacterUseCase(characterRepository: mockCharacterRepository)
        // when
        useCase.loadCharacters { response in
            switch response {
                // then
            case .success(let data):
                XCTAssertEqual(data.count, MockCharacterData.characterData.count)
            case .failure: break
            }
        }
    }
    func testLoadCharacters_whenFailedFetchingCharacters_serverReturnsError() {
        // given
        let mockCharacterRepository = MockCharacterRepository()
        mockCharacterRepository.resultLoadCharacters = .failure(RickMortyError.apiError)
        // when
        let useCase = CharacterUseCase(characterRepository: mockCharacterRepository)
        useCase.loadCharacters { response in
            switch response {
            case .success: break
            case .failure(let error):
                // then
                XCTAssertEqual(error.localizedDescription, RickMortyError.apiError.errorDescription)
            }
        }
    }
}
