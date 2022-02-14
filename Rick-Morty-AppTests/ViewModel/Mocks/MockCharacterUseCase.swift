//
//  MockCharacterUseCase.swift
//  Rick-Morty-AppTests
//
//  Created by SyedAbdulBasit on 06/02/2022.
//

import Foundation
@testable import Rick_Morty_App

final class MockCharacterUseCase: CharacterUseCaseProtocol {
    var resultLoadCharacters: Result<[Character], Error> = .success([])
    func loadCharacters(onCompletion: @escaping CharacterResponse) {
        onCompletion(resultLoadCharacters)
    }
}
