//
//  CountryDetailView.swift
//  SimpleCountrySearchSwiftUI
//
//  Created by Melisa Gülgün on 1.09.2024.
//

import SwiftUI
import Kingfisher
import MapKit

struct CountryDetailView: View {
    @State var currentCountry: CountryListItem?
    
    var body: some View {
        @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentCountry?.capitalInfo?.latlng?.first ?? 0, longitude: currentCountry?.capitalInfo?.latlng?.last ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        VStack {
            VStack(alignment: .center) {
                if let image = currentCountry?.flags?.png {
                    KFImage(URL(string: image)!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
            }
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("Capital : ")
                        .bold()
                    Text(currentCountry?.capital?.first ?? "")
                }
                HStack {
                    Text("Population : ")
                        .bold()
                    Text(String(currentCountry?.population ?? 0))
                }
                Text("Capital Location :")
                    .bold()
                Map(coordinateRegion: $region)
                    .mapControls {
                        MapScaleView()
                        MapCompass()
                        MapPitchToggle()
                    }
                
                    .frame(height: 400)
                
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .navigationTitle(currentCountry?.name?.common ?? "")
        .toolbarRole(.editor)
    }
}

#Preview {
    CountryDetailView()
}
