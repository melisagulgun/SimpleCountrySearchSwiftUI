//
//  CountryListItem.swift
//  SimpleCitySearchSwiftUI
//
//  Created by Melisa Gülgün on 31.08.2024.
//

import Foundation
struct CountryListItem: Decodable, Identifiable {
    var id = UUID()
    let name: CountryName?
    let capital: [String]?
    let flags: CountryFlag?
    let capitalInfo: CapitalInfo?
    let population: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case flags
        case capitalInfo
        case population
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(CountryName.self, forKey: .name)
        self.capital = try container.decodeIfPresent([String].self, forKey: .capital)
        self.flags = try container.decodeIfPresent(CountryFlag.self, forKey: .flags)
        self.capitalInfo = try container.decodeIfPresent(CapitalInfo.self, forKey: .capitalInfo)
        self.population = try container.decodeIfPresent(Int.self, forKey: .population)
    }
    
}

struct CountryName: Decodable {
    let common: String?
    let official: String?
    
    enum CodingKeys: String, CodingKey {
        case common
        case official
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.common = try container.decodeIfPresent(String.self, forKey: .common)
        self.official = try container.decodeIfPresent(String.self, forKey: .official)
    }
}
struct CountryFlag: Decodable {
    let png: String?
    let svg: String?
    let alt: String?
    
    enum CodingKeys: String, CodingKey {
        case png
        case svg
        case alt
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.svg = try container.decodeIfPresent(String.self, forKey: .svg)
        self.png = try container.decodeIfPresent(String.self, forKey: .png)
        self.alt = try container.decodeIfPresent(String.self, forKey: .alt)
    }
}

struct CapitalInfo: Decodable {
    let latlng: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case latlng
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latlng = try container.decodeIfPresent([Double].self, forKey: .latlng)
    }
}
