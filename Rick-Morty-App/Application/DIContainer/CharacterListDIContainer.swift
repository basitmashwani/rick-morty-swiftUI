//
//  CharacterListDIContainer.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//
import UIKit.UINavigationController

protocol CharacterListDependencies {
    func makeCharacterDetailContainer(character: Character) -> CharacterDetailDIContainer
}

final class CharacterListDIContainer: CharacterListDependencies {
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
    func makeCharacterListView() -> CharacterListView {
        let characterListVC = CharacterListView(viewModel: makeCharacterViewModel(), router: .init())
        return characterListVC
    }
    
    func makeCharacterDetailContainer(character: Character) -> CharacterDetailDIContainer {
        CharacterDetailDIContainer(character: character)
    }
   
}
