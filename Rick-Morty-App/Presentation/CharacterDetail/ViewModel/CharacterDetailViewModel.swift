//
//  CharacterDetailViewModel.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation

protocol CharacterDetailViewModelOutput {
    var name: String { get }
    var species: String { get }
    var gender: String { get }
    var status: String { get }
    var location: String { get }
    var imageURL: String { get }
}

class CharacterDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
}

extension CharacterDetailViewModel: CharacterDetailViewModelOutput {
    
    // MARK: - Output
    
    var name: String { character.name }
    var species: String { character.species }
    var gender: String { character.gender }
    var status: String { character.status }
    var location: String { character.lastLocation }
    var imageURL: String { character.imgURL }
}
