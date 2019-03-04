//
//  DataSource.swift
//  PokemonCatalog
//
//  Created by Julio on 3/1/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
/**
    The DataSource of the app.
 */
public struct Pokemon: Codable {
    public let results: [Result]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }

    public init(results: [Result]) {
        self.results = results
    }
}

public struct Result: Codable {
    public let name: String
    public let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }

    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}



