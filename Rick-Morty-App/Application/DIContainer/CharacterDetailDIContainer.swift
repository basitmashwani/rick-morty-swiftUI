//
//  CharacterDetailDIContainer.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//
import UIKit


protocol CharacterDetailDependencies {
   func makeCharacterDetailView() -> CharacterDetailView
}

final class CharacterDetailDIContainer: CharacterDetailDependencies {
    public let character: Character
    init(character: Character) {
        self.character = character
    }
    // MARK: - Character Detail
    /// Get  Character Detail View Model
    /// - Returns:  CharacterDetailViewModel
    func makeCharacterDetailViewModel() -> CharacterDetailViewModel {
        CharacterDetailViewModel(character: character)
    }
    /// Get  CharacterDetail View Controller and Setup View Model
    /// - Returns:  CharacterListViewController
    func makeCharacterDetailView() -> CharacterDetailView {
        CharacterDetailView(viewModel: makeCharacterDetailViewModel())
    }

}
