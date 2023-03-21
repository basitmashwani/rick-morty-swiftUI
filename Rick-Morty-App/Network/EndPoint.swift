//
//  EndPoint.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2023-03-13.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "": "" // "app-id": "YOUR APP ID HERE"
        ]
    }
}


extension Endpoint {
    
    static var characters: Self {
        return Endpoint(path: "/character")
    }
    
}

