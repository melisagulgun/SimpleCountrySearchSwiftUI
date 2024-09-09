//
//  NetworkManagerUtils.swift
//  SimpleCitySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import Foundation
struct NetworkManagerUtils {
    static let shared = NetworkManagerUtils()
    
    func getNetworkURLRequest(path: String) -> URL {
        return URL(string: (self.getBaseNetworkURL() + path))!
    }
    
    private func getBaseNetworkURL() -> String {
        return NetworkConstants.baseURL
    }
}
