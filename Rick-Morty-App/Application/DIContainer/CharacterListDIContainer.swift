//
//  CharacterListDIContainer.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//
import UIKit.UINavigationController

final class CharacterListDIContainer: CharacterListCoordinatorDependencies {
    // MARK: - Use Case
    /// Get Character Use Case
    /// - Returns:  CharacterUseCaseProtocol
    func makeCharacterUse() -> CharacterUseCaseProtocol {
        CharacterUseCase(characterRepository: makeCharacterRepository())
    }
    // MARK: - Repositories
    /// Get  Character Repository
    /// - Returns:  CharacterRepositoryProtocol
    func makeCharacterRepository() -> CharacterRepositoryProtocol {
        CharacterRepository()
    }
    // MARK: - Character List
    /// Get  Character View Model
    /// - Returns:  CharacterListViewModel
    func makeCharacterViewModel() -> CharacterListViewModel {
        CharacterListViewModel(useCase: makeCharacterUse())
    }
    /// Get  CharacterList View Controller and Setup View Model
    /// - Returns:  CharacterListViewController
    func makeCharacterListViewController() -> CharacterListViewController {
        let characterListVC = CharacterListViewController(viewModel: makeCharacterViewModel())
        return characterListVC
    }
    // MARK: - Coordinators
    /// Get  CharacterList Coordinator
    /// - Parameter navigation: UINavigationController
    /// - Returns:  Character List Coordinator
    func  characterCoordinator(navigation: UINavigationController) -> CharacterListCoordinator {
        CharacterListCoordinator(dependencies: self, parent: navigation)
    }
    // MARK: - DIContainers of CharacterDetail
    func makeCharacterDetailDIContainer(character: Character) -> CharacterDetailDIContainer {
        return CharacterDetailDIContainer(character: character)
    }
}
