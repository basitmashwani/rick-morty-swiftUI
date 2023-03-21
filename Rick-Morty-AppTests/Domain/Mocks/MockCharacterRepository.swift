//
//  MockCharacterRepository.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import Foundation
import Combine

@testable import Rick_Morty_App

final class MockCharacterRepository: CharacterRepositoryProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    var resultLoadCharacters: Result<[Character], Error> = .success([])

    func fetchCharacterList() -> AnyPublisher<CharactersDTO, RickMortyError> {
        return Just(CharactersDTO.mock)
            .setFailureType(to: RickMortyError.self)
            .eraseToAnyPublisher()
    }
    
    
    
}
