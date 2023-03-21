//
//  App.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2022-12-07.
//

import Foundation
import SwiftUI
@main
struct RickyMortyApp: App {

    var body: some Scene {
        WindowGroup {
            AppRouter(
                appServiceLocator: .init()
            )
                .routeToCharacterListView()
        }
    }
}
