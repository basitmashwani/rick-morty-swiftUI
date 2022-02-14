//
//  CharacterListCoordinator.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//
import UIKit

protocol CharacterListCoordinatorDependencies {
    func makeCharacterListViewController() -> CharacterListViewController
    func makeCharacterDetailDIContainer(character: Character) -> CharacterDetailDIContainer
}

final class CharacterListCoordinator: BaseCoordinator {
    // MARK: - Properties
    let dependencies: CharacterListCoordinatorDependencies
    private weak var parent: UINavigationController?
    // MARK: - Initializer
    ///  Initialize CharacterListCoordinatorDependencies & UINavigationController
    ///  - Parameter CharacterListCoordinatorDependencies
    ///  - Parameter UINavigationController
    init(dependencies: CharacterListCoordinatorDependencies, parent: UINavigationController) {
        self.dependencies = dependencies
        self.parent = parent
    }
    // MARK: - Coordinator
    /// Initiates the CharacterListView Controller and Display it
    override func start() {
        let characterListVC = dependencies.makeCharacterListViewController()
        characterListVC.itemSelected = { character in
            self.navigateToDetailScreen(with: character)
        }
        parent?.pushViewController(characterListVC, animated: true)
    }

    private func navigateToDetailScreen(with character: Character) {
        let characterDetailDIContainer = dependencies.makeCharacterDetailDIContainer(character: character)
        let coordinator = characterDetailDIContainer.characterDetailCoordinator(navigation: parent!)
        coordinator.start()

    }
}
