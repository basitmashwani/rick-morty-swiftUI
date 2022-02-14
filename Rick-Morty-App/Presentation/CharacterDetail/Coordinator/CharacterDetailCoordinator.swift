//
//  CharacterDetailCoordinator.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import UIKit

protocol CharacterDetailCoordinatorDependencies {
   func makeCharacterDetailViewController() -> CharacterDetailViewController
}

final class CharacterDetailCoordinator: BaseCoordinator {
    // MARK: - Properties
    let dependencies: CharacterDetailCoordinatorDependencies
    private weak var parent: UINavigationController?
    // MARK: - Initializer
    ///  Initialize CharacterDetailCoordinatorDependencies & UINavigationController
    ///  - Parameter CharacterDetailCoordinatorDependencies
    ///  - Parameter UINavigationController
    init(dependencies: CharacterDetailCoordinatorDependencies, parent: UINavigationController) {
        self.dependencies = dependencies
        self.parent = parent
    }
    // MARK: - Coordinator
    /// Initiates the CharacterDetailView Controller and Display it
    override func start() {
        let detailVC = dependencies.makeCharacterDetailViewController()
        parent?.pushViewController(detailVC, animated: true)
    }
}
