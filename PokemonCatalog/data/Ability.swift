//
//  Ability.swift
//  PokemonCatalog
//
//  Created by Julio on 3/3/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
/**
    The Ability model.
 */
public struct Ability: Codable {
    public let effectEntries: [EffectEntry]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
    }
    
    public init(effectEntries: [EffectEntry]) {
        self.effectEntries = effectEntries
    }
}

public struct EffectEntry: Codable {
    public let effect: String
    public let language: Language
    public let shortEffect: String
    
    enum CodingKeys: String, CodingKey {
        case effect = "effect"
        case language = "language"
        case shortEffect = "short_effect"
    }
    
    public init(effect: String, language: Language, shortEffect: String) {
        self.effect = effect
        self.language = language
        self.shortEffect = shortEffect
    }
}

public struct Language: Codable {
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
