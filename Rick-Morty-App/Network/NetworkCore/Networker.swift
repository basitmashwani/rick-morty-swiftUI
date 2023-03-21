//
//  Networker.swift
//  Rick-Morty-App
//
//  Created by Syed Basit on 2023-03-13.
//


import Foundation
import Combine

protocol NetworkerProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers?) -> AnyPublisher<T, Error> where T: Decodable
    
    func getData(url: URL, headers: Headers?) -> AnyPublisher<Data, URLError>
}

final class Networker: NetworkerProtocol {
    
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers? = nil) -> AnyPublisher<T, Error> where T : Decodable {
        
        var urlRequest = URLRequest(url: url)
        
        if let headers {
            headers.forEach { key, value in
                if let value = value as? String {
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getData(url: URL, headers: Headers? = nil) -> AnyPublisher<Data, URLError> {
        
        var urlRequest = URLRequest(url: url)
        
        if let headers {
            headers.forEach { key, value in
                if let value = value as? String {
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
