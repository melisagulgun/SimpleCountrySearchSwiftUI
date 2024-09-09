//
//  NetworkManager.swift
//  SimpleCitySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import Foundation
import Combine
protocol NetworkManagerProtocol {
    func fetch<T: Decodable>(_ path: String, responseObject: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}
class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    func fetch<T: Decodable>(_ path: String, responseObject: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        return URLSession.shared
            .dataTaskPublisher(for: NetworkManagerUtils.shared.getNetworkURLRequest(path: path))
            .tryMap { response in
                return response.data
            }
            .decode(type: responseObject, decoder: JSONDecoder())
            .map { error in
                error
            }
            .eraseToAnyPublisher()
    }
}
