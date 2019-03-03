//
//  Abilities.swift
//  PokemonCatalog
//
//  Created by Julio on 3/1/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
public struct Description: Codable {
    public let descriptions: [DescriptionElement]
    public let geneModulo: Int
    public let highestStat: HighestStat
    public let id: Int
    public let possibleValues: [Int]
    
    enum CodingKeys: String, CodingKey {
        case descriptions = "descriptions"
        case geneModulo = "gene_modulo"
        case highestStat = "highest_stat"
        case id = "id"
        case possibleValues = "possible_values"
    }
    
    public init(descriptions: [DescriptionElement], geneModulo: Int, highestStat: HighestStat, id: Int, possibleValues: [Int]) {
        self.descriptions = descriptions
        self.geneModulo = geneModulo
        self.highestStat = highestStat
        self.id = id
        self.possibleValues = possibleValues
    }
}

public struct DescriptionElement: Codable {
    public let description: String
    public let language: HighestStat
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case language = "language"
    }
    
    public init(description: String, language: HighestStat) {
        self.description = description
        self.language = language
    }
}

public struct HighestStat: Codable {
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
