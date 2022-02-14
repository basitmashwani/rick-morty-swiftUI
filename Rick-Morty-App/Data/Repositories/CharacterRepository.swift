//
//  CharacterRepository.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
 typealias CharacterResponse = (Result<[Character], Error>) -> Void

protocol CharacterRepositoryProtocol {
    /// it will fetch characters.
    /// - Parameter completion: block triggered when fetching is completed.
    func fetchCharacterList(onCompletion: @escaping CharacterResponse)
}

final class CharacterRepository: CharacterRepositoryProtocol {
    // MARK: - Protocol Implementation
    /// Fetch characters using datastore from api.
    /// - Parameters: closure to return character array in case of success and error in the case of failure
    func fetchCharacterList(onCompletion: @escaping CharacterResponse) {
        RestService.shared
            .request(.get, path: .getCharacter, parameters: nil)
            .handleRequest { (result: Result<CharactersDTO, RickMortyError>) in
                switch result {
                case .success(let charactersResponse):
                    let characters = charactersResponse.characters.map { $0.toDomain() }
                    onCompletion(.success(characters))
                case .failure(let error):
                    onCompletion(.failure(RickMortyError.other(error)))
                case .success(let characterResponse) where characterResponse.characters.isEmpty:
                onCompletion(.failure(RickMortyError.characterNotFound))
                }
            }
        }
}
