//
//  AppCooridinator.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//

import SwiftUI
protocol RouteToCharacterList {
    func routeToCharacterListView() -> CharacterListView
}


final class AppRouter {
    private let appServiceLocator: AppDIContainer
    
    init(appServiceLocator: AppDIContainer) {
        self.appServiceLocator = appServiceLocator
    }
}

extension AppRouter: RouteToCharacterList {
    func routeToCharacterListView() -> CharacterListView {
        appServiceLocator
            .makeCharacterListDIContainer()
            .makeCharacterListView()
    }
}


