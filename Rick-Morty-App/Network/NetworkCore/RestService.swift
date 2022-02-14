//
//  RestService.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//
import Foundation

final class RestService: HTTPService {
    static let shared = RestService()
    var baseURL: URL {
        URL(string: API.characterListEndPoint)!
    }
    func request(_ method: HTTPMethod, path: RickMortyApi, parameters: Parameters?,
                 queryItems: [URLQueryItem]? = nil) -> RickMortyRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path.path))
        if let queryParams = queryItems {
             let url = baseURL.appendingPathComponent(path.path).addQueryParms(queryParams)
                urlRequest = URLRequest(url: url)
        }
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return RickMortyRequest(request: urlRequest)
    }
    }

struct RickMortyRequest {
    let request: URLRequest
     var session: URLSession = URLSession.shared
}

extension RickMortyRequest {
    func handleRequest<T: Decodable>(completion: @escaping (Result<T, RickMortyError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.other(error!)))
                return
            }
            let response = try? JSONDecoder().decode(T.self, from: data)
            if let item = response {
                completion(.success(item))
            } else {
                completion(.failure(.apiError))
            }
            }
        task.resume()
    }

}
