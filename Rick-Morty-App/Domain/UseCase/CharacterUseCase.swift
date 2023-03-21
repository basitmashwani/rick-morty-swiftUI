//
//  CharacterUseCase.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
import Combine
protocol CharacterUseCaseProtocol {
    func loadCharacters() -> AnyPublisher<[Character], RickMortyError>
}

final class CharacterUseCase: CharacterUseCaseProtocol {
    // MARK: - Private Property
    private let characterRepository: CharacterRepositoryProtocol

    // MARK: - Initializer
    /// Initialize the characterRepository
    /// - Parameter CharacterRepositoryProtocol
    init(characterRepository: CharacterRepositoryProtocol) {
        self.characterRepository = characterRepository
    }
    /// Load characters from character repo and returns the result
    /// - Parameter onCompletion: closure to return character array in case of success and error in the case of failure
    func loadCharacters() -> AnyPublisher<[Character], RickMortyError> {
        characterRepository
            .fetchCharacterList()
            .map { $0.characters.map { $0.toDomain()}}
            .eraseToAnyPublisher()
        
    }
}
