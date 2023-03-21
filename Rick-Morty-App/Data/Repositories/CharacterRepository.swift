//
//  CharacterRepository.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
import Combine

protocol CharacterRepositoryProtocol {
    var networker: NetworkerProtocol { get }
    /// it will fetch characters.
    /// - Parameter completion: block triggered when fetching is completed.
    func fetchCharacterList() -> AnyPublisher<CharactersDTO, RickMortyError>
}

final class CharacterRepository: CharacterRepositoryProtocol {
    var networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    // MARK: - Protocol Implementation
    /// Fetch characters using datastore from api.
    /// - Parameters: closure to return character array in case of success and error in the case of failure
    func fetchCharacterList() -> AnyPublisher<CharactersDTO, RickMortyError> {
        networker
            .get(
                type: CharactersDTO.self,
                url: Endpoint.characters.url,
                headers: nil
            )
            .mapError { error in
                RickMortyError.other(error)
            }
            .eraseToAnyPublisher()
            
    }
}
