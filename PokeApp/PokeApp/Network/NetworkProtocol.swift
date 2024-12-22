//
//  NetworkProtocol.swift
//  PokeApp
//
//  Created by Aldair Cosetito Coral on 22/12/24.
//

import Foundation

protocol NetworkProtocol {
    func executeRequest<T: Codable>(_ request: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}
