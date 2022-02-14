//
//  RickMortyEndpoint.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
protocol Path {
    var path: String { get }
}
enum RickMortyApi {
    case getCharacter

}
extension RickMortyApi: Path {
    var path: String {
        switch self {
        case .getCharacter: return  "/character"
        }
    }
}
