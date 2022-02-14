//
//  AppCooridinator.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//
import UIKit
final class AppCoordinator: BaseCoordinator {
    // MARK: - Properties
    let navigationController: UINavigationController
    private let appServiceLocator: AppDIContainer

    // MARK: - Initializer
    /// - Parameter UINavigationController
    /// - Parameter AppServiceLocation
    init(parent: UINavigationController, appServiceLocator: AppDIContainer) {
        self.navigationController = parent
        self.appServiceLocator = appServiceLocator
    }
    // MARK: - Coordinator
    /// Start CharacterListCoordinator
    override func start() {
        let characterListDIContainer = appServiceLocator.makeCharacterListDIContainer()
        let characterListCoordinator = characterListDIContainer.characterCoordinator(navigation: navigationController)
        characterListCoordinator.start()
    }
}
