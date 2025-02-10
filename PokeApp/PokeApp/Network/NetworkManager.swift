//
//  NetworkManager.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 22/12/24.
//

import Foundation

enum ApiType {
    case pokemonList(page: Int)
    case characteristics(id: Int)
    case evolution(id: Int)
    case pokeDetail(value: String)
    
    private var baseUrl: String {
        return "https://pokeapi.co/api/v2/"
    }

    private func getUrl() -> URL? {
        switch self {
        case .pokemonList(let page):
            let offset = page == 0 ? 20 : page * 20
            return URL(string: "\(baseUrl)pokemon/?offset\(offset)&limit=20")
        case .characteristics(let id):
            return URL(string: "\(baseUrl)characteristics/\(id)")
        case .evolution(let id):
            return URL(string: "\(baseUrl)evolution-chain/\(id)")
        case .pokeDetail(let value):
            return URL(string: "\(baseUrl)pokemon/\(value)")
        }
    }
    
    func request() -> URLRequest? {
        guard let url = self.getUrl() else {
            return nil
        }

        return URLRequest(url: url)
    }
}

struct NetworkManager {

}

extension NetworkManager: NetworkProtocol {
    
    func executeRequest<T: Codable>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error  in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
