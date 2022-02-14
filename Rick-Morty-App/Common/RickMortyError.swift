//
//  Constants.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
struct API {
    static let characterListEndPoint = "https://rickandmortyapi.com/api"
}
    enum RickMortyError: LocalizedError {
        case characterNotFound
        case apiError
        case other(Error)

        var errorDescription: String? {
            switch self {
            case .apiError:
                return "Ops Something went wrong. Please try later!"
            case .characterNotFound:
                return "Characters are not found. please try again later"
            case .other(let error):
                return error.localizedDescription
            }
        }
    }
