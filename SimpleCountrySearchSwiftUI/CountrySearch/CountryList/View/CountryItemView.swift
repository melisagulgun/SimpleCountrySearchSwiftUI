//
//  CountryItemView.swift
//  SimpleCountrySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import SwiftUI
import Kingfisher

struct CountryItemView: View {
    @State var country: CountryListItem?
    var body: some View {
        HStack(alignment: .center) {
            if let url = URL(string: country?.flags?.png ?? "") {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 30)
            }
            VStack(alignment: .leading){
                HStack {
                    Text("Name:")
                        .bold()
                    Text(country?.name?.common ?? "")
                    Spacer()
                }
                HStack {
                    Text("Capital:")
                        .bold()
                    Text(country?.capital?.first ?? "")
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(0)
    }
}

#Preview {
    CountryItemView()
}
