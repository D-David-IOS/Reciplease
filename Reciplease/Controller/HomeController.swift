//
//  HomeController.swift
//  Reciplease
//
//  Created by David-IOS on 06/08/2021.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchRecipe: UIButton!
    
    
    
    var recip = RecipeRequest(session : URLSession(configuration: .default))
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    

    @IBAction func searchButton(_ sender: Any) {
        recip.getRecipe(request: recip.createRecipRequest()) { (true, recipe ) in
            print(recipe)
            print(recipe?.links.next.href)
        }
    }
    
}

extension HomeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredient.ingredient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        let ingredient = "      - " + ingredient.ingredient[indexPath.row]
        
        cell.textLabel?.text = ingredient
        
        return cell
    }
    
}
