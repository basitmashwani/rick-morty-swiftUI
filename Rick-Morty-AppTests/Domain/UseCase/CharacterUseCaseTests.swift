//
//  CharacterUseCaseTests.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import XCTest
import Combine
@testable import Rick_Morty_App

class CharacterUseCaseTests: XCTestCase {
    func testLoadCharacters_whenSuccessfullyFetchesCharacter_shouldHaveCharacters() {
        // given
        
         var cancellables = Set<AnyCancellable>()

        let mockCharacterRepository = MockCharacterRepository()
        mockCharacterRepository.resultLoadCharacters = .success(MockCharacterData.characterData)
        let useCase = CharacterUseCase(characterRepository: mockCharacterRepository)
        // when
        useCase.loadCharacters()
            .sink { _ in
                
            } receiveValue: { characters in
                XCTAssertEqual(characters.count, MockCharacterData.characterData.count)
            }
            .store(in: &cancellables)
    }
    func testLoadCharacters_whenFailedFetchingCharacters_serverReturnsError() {
        // given
        var cancellables = Set<AnyCancellable>()
        let mockCharacterRepository = MockCharacterRepository()
        mockCharacterRepository.resultLoadCharacters = .failure(RickMortyError.apiError)
        // when
        let useCase = CharacterUseCase(characterRepository: mockCharacterRepository)
        useCase.loadCharacters()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                    
                case .failure(let error):
                    XCTAssertEqual(error.localizedDescription, RickMortyError.apiError.errorDescription)
                }
            }, receiveValue: { _ in
                
            })
            .store(in: &cancellables)

    }
}
