//
//  CountrySearchViewModel.swift
//  SimpleCitySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import Foundation
import Combine

class CountrySearchViewModel: ObservableObject {
    @Published var countryList: [CountryListItem]?
    private var networkManager: NetworkManagerProtocol?
    var cancellableSet = Set<AnyCancellable>()
    @Published var allCountriesList: [CountryListItem]?

    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getCities(cityName: String) {
        self.networkManager?.fetch("name/\(cityName)", responseObject: [CountryListItem].self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                switch response {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { response in
                self.countryList = response
            })
            .store(in: &cancellableSet)
        
    }
        func getAllCities() {
        self.networkManager?.fetch("all/", responseObject: [CountryListItem].self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { response in
                switch response {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { response in
                self.countryList = response
                self.allCountriesList = response
            })
            .store(in: &cancellableSet)
        
    }
}
