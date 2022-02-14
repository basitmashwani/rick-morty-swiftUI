//
//  HTTP.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//

import Foundation
public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}
public typealias Parameters = [String: Any]

protocol HTTPService {
    func request(_ method: HTTPMethod, path: RickMortyApi, parameters: [String: Any]?,
                 queryItems: [URLQueryItem]?) -> RickMortyRequest
}
