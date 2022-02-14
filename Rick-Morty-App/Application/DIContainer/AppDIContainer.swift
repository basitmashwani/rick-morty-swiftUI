//
//  AppDIContainer.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
final class AppDIContainer {
    // MARK: - DIContainers of CharacterList
    func makeCharacterListDIContainer() -> CharacterListDIContainer {
        return CharacterListDIContainer()
    }
}
