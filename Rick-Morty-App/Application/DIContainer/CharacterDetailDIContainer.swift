//
//  CharacterDetailDIContainer.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//
import UIKit
final class CharacterDetailDIContainer: CharacterDetailCoordinatorDependencies {
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
    func makeCharacterDetailViewController() -> CharacterDetailViewController {
        CharacterDetailViewController(viewModel: makeCharacterDetailViewModel())
    }
    // MARK: - Coordinators
    /// Get  CharacterList Coordinator
    /// - Parameter navigation: UINavigationController
    /// - Returns:  Character List Coordinator
    func  characterDetailCoordinator(navigation: UINavigationController) -> CharacterDetailCoordinator {
        CharacterDetailCoordinator(dependencies: self, parent: navigation)
    }
}
