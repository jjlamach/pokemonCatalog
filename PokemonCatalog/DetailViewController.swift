//
//  ViewController.swift
//  PokemonCatalog
//
//  Created by Julio on 3/1/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonName: UILabel!
    var name: String = ""
    
    
    @IBOutlet weak var pokemonCharacteristics: UILabel!
    var characteristic: String = ""
    
    @IBOutlet weak var pokemonAbility: UITextView!
    var ability: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pokemonName.text = name
        pokemonCharacteristics.text = characteristic
        pokemonAbility.text = ability
    }
}

