//
//  PokemonViewController.swift
//  PokemonCatalog
//
//  Created by Julio on 3/1/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

// additional functionality for String.
extension String {
    func firstLetterUpperCased() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    mutating func capitalizedFirstLetter() {
        self = self.firstLetterUpperCased()
    }
}


class PokemonViewController: UITableViewController {
    
    var pokemonNames: [String] = []
    var pokemonAbilities: [String] = []
    var pokemonCharacteristics: [String] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.getPokemons()
        self.getPokemonCharacteristics()
        self.getPokemonAbilities()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    /**
        Gets 30 Pokemons from the endpoint.
    */
    private func getPokemons() -> Void {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=30&limit=30") else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: url) {
            (data, response, error)
            in
            if let pokeData = data {
                do {
                    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokeData)
                    if let array = pokemon?.results {
                        print(array)
                        let array_of_pokemons = array
                        for pokemon in array_of_pokemons {
                            let upperCasedPokemon = pokemon.name.firstLetterUpperCased()
                            self.pokemonNames.append(upperCasedPokemon)
                        }
                    }
                    // this reloads the data again after the table view loads.
                    DispatchQueue.main.async {
                        if error == nil {
                             self.tableView.reloadData()
                        }
                        else {
                            print("Not getting data")
                        }
                    }
                }
            }
        }.resume()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pokemonNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        cell.name.text = self.pokemonNames[indexPath.row]
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    /**
     Gets Pokemon characteristics.
    */
    private func getPokemonCharacteristics() -> Void {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pokeapi.co"
        
        for pokemonId in stride(from: 1, through: 30, by: 1) {
            let pokemonId = String(pokemonId)
            
            urlComponents.path = "/api/v2/characteristic/" + pokemonId
            
            guard let url = URL(string: urlComponents.string!) else {
                return
            }
            let httpSession = URLSession.shared
            httpSession.dataTask(with: url) {
                (data, response, error)
                        in
                if let pokeData = data {
                    
                    do {
                        let description = try? JSONDecoder().decode(Description.self, from: pokeData)
                        if let description = description {
                            let descriptionObjectArray = description.descriptions
                                for description in descriptionObjectArray {
                                    if description.language.name == "en" {
                                        let descriptionName = description.description
                                        self.pokemonCharacteristics.append(descriptionName)
                                    }
                            }
                        }
                        DispatchQueue.main.async {
                            if error == nil {
                                self.tableView.reloadData()
                            } else {
                                print("Not getting any data.")
                            }
                        }
                    }
                }
            }.resume()
        }
    }
    
    /**
        Gets Pokemon abilities.
    */
    private func getPokemonAbilities() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pokeapi.co"
        
        for pokemonId in stride(from: 1, through: 30, by: 1) {
            let pokemonId = String(pokemonId)
            
            urlComponents.path = "/api/v2/ability/" + pokemonId + "/"
            
            guard let url = URL(string: urlComponents.string!) else {
                return
            }
            let httpSession = URLSession.shared
            httpSession.dataTask(with: url) {
                (data, response, error)
                in
                if let pokeData = data {
                    
                    do {
                        let ability = try? JSONDecoder().decode(Ability.self, from: pokeData)
                        if let ability = ability {
                            let effectEntriesArray = ability.effectEntries
                            for effectEntry in effectEntriesArray {
                                if effectEntry.language.name == "en" {
                                    let longTermEffect = effectEntry.effect
                                    self.pokemonAbilities.append(longTermEffect)
                                }
                            }
                        }
                        DispatchQueue.main.async {
                            if error == nil {
                                self.tableView.reloadData()
                            } else {
                                print("Not getting any data.")
                            }
                        }
                    }
                }
                }.resume()
        }
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let viewCtrl = segue.destination as? ViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                viewCtrl.name = self.pokemonNames[indexPath.row]
                viewCtrl.characteristic = self.pokemonCharacteristics[indexPath.row]
                viewCtrl.ability += self.pokemonAbilities[indexPath.row]
                
            }
        }
    }
}
