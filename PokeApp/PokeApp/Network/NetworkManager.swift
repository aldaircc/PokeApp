//
//  NetworkManager.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 22/12/24.
//

import Foundation

struct NetworkManager {
    let baseStringUrl = "https://pokeapi.co/api/v2/" //pokemon?limit=100&offset=0
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
