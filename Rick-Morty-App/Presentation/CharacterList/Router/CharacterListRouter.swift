//
//  CharacterRouter.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2023-03-20.
//

import SwiftUI


protocol RouteToCharacterDetail {
    @ViewBuilder func routeToCharacterDetailView(character: Character) -> CharacterDetailView
}

final class CharacterListRouter {
    private let container: CharacterListDIContainer
    
    init(container: CharacterListDIContainer = .init()) {
        self.container = container
    }
}

extension CharacterListRouter: RouteToCharacterDetail {
    @ViewBuilder func routeToCharacterDetailView(character: Character) ->CharacterDetailView {
        container
            .makeCharacterDetailContainer(character: character)
            .makeCharacterDetailView()

    }
}
