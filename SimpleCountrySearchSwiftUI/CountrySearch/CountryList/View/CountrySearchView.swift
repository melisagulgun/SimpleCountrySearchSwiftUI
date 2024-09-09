//
//  CountrySearchView.swift
//  SimpleCitySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import SwiftUI
import Combine

struct CountrySearchView: View {
    @ObservedObject var viewModel = CountrySearchViewModel(networkManager: NetworkManager.shared)
    @State var counrtyName: String = ""
    @State var selectedIndex = 0
    
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Country Here...", text: $counrtyName)
                    .onChange(of: counrtyName) { oldValue, newValue in
                        if newValue.count > 2 {
                            viewModel.getCities(cityName: newValue)
                        } else {
                            viewModel.countryList = viewModel.allCountriesList
                        }
                    }
                List(viewModel.countryList ?? [CountryListItem]()) { index in
                    NavigationLink {
                        CountryDetailView(currentCountry: index)
                    } label: {
                        CountryItemView(country: index)
                        
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))

                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)

            }
            .listStyle(PlainListStyle())
            .padding(16)
            .background(Color.clear)
            .onAppear {
                viewModel.getAllCities()
            }
        }
    }
}

#Preview {
    CountrySearchView()
}
