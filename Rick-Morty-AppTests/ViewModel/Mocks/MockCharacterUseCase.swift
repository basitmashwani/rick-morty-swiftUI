//
//  MockCharacterUseCase.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import Foundation
import Combine
@testable import Rick_Morty_App

final class MockCharacterUseCase: CharacterUseCaseProtocol {
    var resultLoadCharacters: Result<[Character], Error> = .success([])
    func loadCharacters() -> AnyPublisher<[Character], RickMortyError> {
        return Just(MockCharacterData.characterData)
            .setFailureType(to: RickMortyError.self)
            .eraseToAnyPublisher()
    }
}
